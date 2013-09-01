using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AssemblerXP
{
    public partial class AssemblerForm : Form
    {

        private ArrayList lineList = new ArrayList();   // List of source file instructions
        private ArrayList labels = new ArrayList();     // List of label strings
        private ArrayList labelList = new ArrayList();  // List of Pairs for jump labels
        private ArrayList errorList = new ArrayList();  // List of lines containing errors
        int sourceLineCount;
        int destLineCount;

        public AssemblerForm()
        {
            InitializeComponent();
        }

        // Set assembly source file
        private void sourceButton_Click(object sender, EventArgs e)
        {
            if (sourceOpenFileDialog.ShowDialog() == DialogResult.OK)
            {
                sourceTextBox.Text = sourceOpenFileDialog.FileName;
            }
        }

        // Set binary output file
        private void destinationButton_Click(object sender, EventArgs e)
        {
            if (destinationOpenFileDialog.ShowDialog() == DialogResult.OK)
            {
                destinationTextBox.Text = destinationOpenFileDialog.FileName;
            }
        }

        // Converts a single instruction from assembly to binary
        private void convertLineButton_Click(object sender, EventArgs e)
        {
            String source = sourceLineTextBox.Text;

            convertedLineTextBox.Text = convertToBinary(source);
        }

        // Converts an assembly file line by line 
        private void quickConvButton_Click(object sender, EventArgs e)
        {
            sourceLineCount = 0;            // Keep track of source line numbers for error reporting
            destLineCount = 0;              // Use to keep track of output addresses for branch label offset and jump label calculations
            sourceFileTextBox.Text = "";    // Location of input assembly file
            destFileTextBox.Text = "";      // Location of output binary file
            destHexTextBox.Text = "";       // Use this to display binary instructions in HEX for debugging
            labelsTextBox.Text = "";        // Use this to display all labels with their addresses for help debugging code
            lineList = new ArrayList();     // Keep track of lines
            labelList = new ArrayList();    // Keep track of lables with their binary addresses (Use LabelPair helper class)
            labels = new ArrayList();       // Keep track of label names
            errorList = new ArrayList();    // List to keep track of errors
            

            // No source file selected
            if (!File.Exists(sourceTextBox.Text))
            {
                MessageBox.Show("Please enter a valid source file", "File Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            // No destination file selected
            if (destinationTextBox.Text == "")
            {
                MessageBox.Show("Please Enter a Destination File", "File Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            else
            {
                // Check to see if destination file exists,
                // Create it if it doesn't, ask to overwrite if it does
                if (File.Exists(destinationTextBox.Text))
                {
                    if (destinationTextBox.Text == sourceFileTextBox.Text)
                    {
                        MessageBox.Show("Destination file cannot be the same as the source file!", "File Error",
                            MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return;
                    }
                    DialogResult result = MessageBox.Show(destinationTextBox.Text +
                        " already exists.  Do you want to overwrite it?", "Overwrite File?",
                        MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                    if (result == DialogResult.Yes)
                    {
                        File.Delete(destinationTextBox.Text);
                    }
                    else
                    {
                        return;
                    }

                }

                StreamReader sourceFile = new StreamReader(sourceTextBox.Text, true);  // Open source file

                {
                    ArrayList destLineList = new ArrayList();       // List of output instructions
                    String line;                                    // Current working line

                    // First time through file is to create a label list to use for 
                    // branch offset and jump address calculations
                    while ((line = sourceFile.ReadLine()) != null)
                    {
                        // Remove whitespaces from beginning and end of line
                        char[] trimWhite = {};
                        line = line.TrimStart(trimWhite);
                        line = line.TrimEnd(trimWhite);
                        line = line.ToUpper();

                        // Allos comments with : without creating a label
                        String[] splitLine = Regex.Split(line, "//");
                        line = splitLine[0].TrimEnd();

                        if (!line.StartsWith("//") && (line != ""))
                        {
                            if (line.Contains(':'))
                            {
                                LabelPair pair;

                                // Remove whitespaces and get label by itself
                                char[] trimChars = { ':', ' ', '\t' };
                                String trimmed = line.TrimEnd(trimChars);
                                String[] split = Regex.Split(trimmed, @"\s+");
                                String lbl = split[0];
                                pair = new LabelPair(lbl, destLineCount);

                                // Make sure label is not a duplicate
                                if (!labels.Contains(split[0]))
                                {
                                    labels.Add(lbl);
                                    labelList.Add(pair);
                                }
                                else
                                {
                                    // Generate an error if it is a duplicate
                                    errorList.Add(new LabelPair(split[0], sourceLineCount));
                                }
                            }

                            // Get rid of leading tabs
                            else if (line.StartsWith("\t"))
                            {
                                char[] trimChars = { '\t' };
                                line.TrimStart(trimChars);
                            }

                            // Compensate for jump instructions being expanded into three instructions
                            else if (line.StartsWith("J")) 
                            {
                                destLineCount++;
                                destLineCount++;
                                destLineCount++;
                            }

                            // All other instructions need only one line
                            else
                            {
                                destLineCount++;
                            } 
                        }
                    }

                    destLineCount = 0;
                    sourceFile.Close();

                    // Re-open file for second time through
                    sourceFile = new StreamReader(sourceTextBox.Text, true);

                    using (StreamWriter destFile = File.CreateText(destinationTextBox.Text))
                    {
                        // Second time through file is for actual instruction conversion
                        while ((line = sourceFile.ReadLine()) != null)
                        {
                            // Remove leading and trailing whitespaces
                            char[] trimWhite = { };
                            line = line.TrimStart(trimWhite);
                            line = line.TrimEnd(trimWhite);
                            line = line.ToUpper();
                            
                            if (!line.StartsWith("//") && (line != "")) // Ignore comment lines and empty lines
                            {
                                String[] splitLine = Regex.Split(line, "//");  // Ignore comments after instructions
                                line = splitLine[0].TrimEnd();

                                if (!line.Contains(':'))    // Make sure the line is not a label, then parse it as an instruction
                                {
                                    sourceFileTextBox.Text += line;
                                    sourceFileTextBox.Text += Environment.NewLine;
                                    if (line.StartsWith("JAL"))
                                    {
                                        try
                                        {
                                            String[] binaryLines = jumpAndLink(line);
                                            if (binaryLines[0].Contains("error") ||
                                                binaryLines[1].Contains("error") ||
                                                binaryLines[2].Contains("error"))
                                            {
                                                errorList.Add(new LabelPair(line, sourceLineCount));
                                            }
                                            destLineList.Add(binaryLines[0]);
                                            destLineList.Add(binaryLines[1]);
                                            destLineList.Add(binaryLines[2]);
                                            destLineCount++;
                                            destLineCount++;
                                            destLineCount++;
                                            sourceLineCount++;
                                        }
                                        catch
                                        {
                                            destLineList.Add("JAL error");
                                            errorList.Add(new LabelPair(line, sourceLineCount));
                                        }
                                    }
                                    else if (line.StartsWith("J"))  // Jump instructions all expand into 3 binary instructions
                                    {
                                        try
                                        {
                                            sourceFileTextBox.Text += line;
                                            sourceFileTextBox.Text += Environment.NewLine;
                                            String[] binaryLines = jump(line);
                                            destLineList.Add(binaryLines[0]);
                                            destLineList.Add(binaryLines[1]);
                                            destLineList.Add(binaryLines[2]);
                                            destLineCount++;
                                            destLineCount++;
                                            destLineCount++;
                                            sourceLineCount++;
                                        }
                                        catch
                                        {
                                            destLineList.Add("JCond error");
                                            errorList.Add(new LabelPair(line, sourceLineCount));
                                        }
                                    }
                                    else
                                    {
                                        String destLine = convertToBinary(line);
                                        destLineList.Add(destLine);
                                        if (destLine.Contains("error"))
                                        {
                                            errorList.Add(new LabelPair(line, sourceLineCount));
                                        }
                                        destLineCount++;
                                        sourceLineCount++;
                                    }
                                }
                                else // it is a label
                                {
                                    sourceFileTextBox.Text += line;
                                    sourceFileTextBox.Text += Environment.NewLine;
                                    sourceLineCount++; 
                                }
                            }
                            else // It is a comment
                            {
                                sourceLineCount++; 
                            }
                        }

                        // Output binary instructions to file and textbox and output Hex to textbox
                        for (int i = 0; i < destLineList.Count; i++) 
                        {
                            destFile.WriteLine(destLineList[i]);
                            destFileTextBox.Text += destLineList[i];
                            destFileTextBox.Text += Environment.NewLine;
                            destHexTextBox.Text += convertBinToHex((String)destLineList[i]);
                            destHexTextBox.Text += Environment.NewLine;
                        }

                        for (int i = 0; i < labelList.Count; i++)
                        {
                            LabelPair currentLabel = (LabelPair)labelList[i];
                            labelsTextBox.Text += currentLabel.Label + "\t" + currentLabel.LineNum + 
                                "\t" + convertUImm8(currentLabel.LineNum.ToString()) + Environment.NewLine;
                        }

                        //pad file to fill 2^14 lines and the map located from 13396 to 14263
                        int ii;
                        int iii;
                        for (ii = destLineList.Count; ii < 13395; ii++)
                        {
                            destFile.WriteLine("0000000000000000");
                        }

                        String mapstring = Properties.Resources.PacmanMap1;
                        destFile.Write(mapstring);
                        destFile.Write(Environment.NewLine);
                        for (iii = 14264; iii < 16384; iii++)
                        {
                            destFile.WriteLine("0000000000000000");
                        }
                        
                        destFile.Write("0000000000000000");
                        destFile.Close();
                    }
                    sourceFile.Close();
                }

                // If there were errors, generate the message with a list of the errors and their source file line numbers
                if (errorList.Count != 0)
                {
                    ErrorForm errorForm = new ErrorForm();
                    errorForm.errorTextBox.Text = "";
                    foreach (LabelPair error in errorList)
                    {
                        errorForm.errorTextBox.Text += error.LineNum + "\t" + error.Label + Environment.NewLine;
                    }
                    errorForm.Show();
                }
            }

        }

        // Converts an assembly instruction into a binary machine code instruction
        private String convertToBinary(String assembly)
        {
            String[] instruction = Regex.Split(assembly, @"\s+"); // split on white spaces
            String OpCode = "";
            String OpExt = "";
            String Rsrc = "";
            String Rdest = "";
            String Raddr = "";
            String Ramount = "";
            String Imm = "";
            String Cond = "";
            String Disp = "";
            String binary = "";

            // NOP Assembly format = INST
            if (instruction[0] == "NOP")
            {
                binary = "0000000000000000";
            }

            // ADD Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "ADD")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "0101";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // ADDI Assembly format = INST Imm Rdest
            else if (instruction[0] == "ADDI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((-128 <= Immediate) && (Immediate <= 127))      // Make sure it is within 8 bit signed range
                {
                    OpCode = "0101";
                    Imm = convertImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // ADDU Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "ADDU")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "0110";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // ADDUI Assembly format = INST Imm Rdest
            else if (instruction[0] == "ADDUI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((0 <= Immediate) && (Immediate <= 255))     // Make sure it is within 8 bit unsigned range
                {
                    OpCode = "0110";
                    Imm = convertUImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // ADDC Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "ADDC")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "0111";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // ADDCI Assembly format = INST Imm Rdest
            else if (instruction[0] == "ADDCI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((-128 <= Immediate) && (Immediate <= 127))      // Make sure it is within 8 bit signed range
                {
                    OpCode = "0111";
                    Imm = convertImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // MUL Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "MUL")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "1110";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // MULI Assembly format = INST Imm Rdest
            else if (instruction[0] == "MULI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((-128 <= Immediate) && (Immediate <= 127))      // Make sure it is within 8 bit signed range
                {
                    OpCode = "1110";
                    Imm = convertImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // SUB Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "SUB")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "1001";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // SUBI Assembly format = INST Imm Rdest
            else if (instruction[0] == "SUBI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((-128 <= Immediate) && (Immediate <= 127))      // Make sure it is within 8 bit signed range
                {
                    OpCode = "1001";
                    Imm = convertImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // SUBC Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "SUBC")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "1010";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // SUBCI Assembly format = INST Imm Rdest
            else if (instruction[0] == "SUBCI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((-128 <= Immediate) && (Immediate <= 127))      // Make sure it is within 8 bit signed range
                {
                    OpCode = "1010";
                    Imm = convertImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // CMP Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "CMP")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "1011";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // CMPI Assembly format = INST Imm Rdest
            else if (instruction[0] == "CMPI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((0 <= Immediate) && (Immediate <= 255))     // Make sure it is within 8 bit unsigned range
                {
                    OpCode = "1011";
                    Imm = convertImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
                OpCode = "1011";
                Imm = convertImm8(instruction[1]);
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + Imm;
            }

            // AND Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "AND")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "0001";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // ANDI Assembly format = INST Imm Rdest
            else if (instruction[0] == "ANDI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((0 <= Immediate) && (Immediate <= 255))     // Make sure it is within 8 bit unsigned range
                {
                    OpCode = "0001";
                    Imm = convertUImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // OR Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "OR")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "0010";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // ORI Assembly format = INST Imm Rdest
            else if (instruction[0] == "ORI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((0 <= Immediate) && (Immediate <= 255))     // Make sure it is within 8 bit unsigned range
                {
                    OpCode = "0010";
                    Imm = convertUImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // XOR Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "XOR")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "0011";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // XORI Assembly format = INST Imm Rdest
            else if (instruction[0] == "XORI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((0 <= Immediate) && (Immediate <= 255))     // Make sure it is within 8 bit unsigned range
                {
                    OpCode = "0011";
                    Imm = convertUImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // MOV Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "MOV")
            {
                OpCode = "0000";
                Rsrc = convertReg(instruction[1]);
                OpExt = "1101";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // MOVI Assembly format = INST Imm Rdest
            else if (instruction[0] == "MOVI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((0 <= Immediate) && (Immediate <= 255))     // Make sure it is within 8 bit unsigned range
                {
                    OpCode = "1101";
                    Imm = convertUImm8(instruction[1]);
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // LSH Assembly format = INST Ramount Rdest
            else if (instruction[0] == "LSH")
            {
                OpCode = "1000";
                Ramount = convertReg(instruction[1]);
                OpExt = "0100";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Ramount;
            }

            // LSHI Assembly format = INST Imm Rdest
            else if (instruction[0] == "LSHI")
            {
                short Immediate = Convert.ToInt16(instruction[1]);
                if ((0 <= Immediate) && (Immediate <= 255))     // Make sure it is within 8 bit unsigned range
                {
                    OpCode = "1000";
                    Imm = "000" + convertImm5(instruction[1]); // 5 bit 2's compliment padded to 8 bits
                    Rdest = convertReg(instruction[2]);
                    binary = OpCode + Rdest + Imm;
                }
                else binary = "Imm range error";
            }

            // ASHU Assembly format = INST Ramount Rdest
            else if (instruction[0] == "ASHU")
            {
                OpCode = "1000";
                Rdest = convertReg(instruction[2]);
                Ramount = convertReg(instruction[1]); // 2's comp (-15 to 15)
                OpExt = "0110";
                binary = OpCode + Rdest + OpExt + Ramount;
            }

            // ASHUI Assembly format = INST Imm Rdest
            else if (instruction[0] == "ASHUI")
            {
                OpCode = "1000";
                Rdest = convertReg(instruction[2]);
                Imm = "001" + convertImm5(instruction[1]);
                binary = OpCode + Rdest + Imm;
            }

            // LUI Assembly format = INST Imm Rdest
            else if (instruction[0] == "LUI")
            {
                OpCode = "1111";
                Rdest = convertReg(instruction[2]);
                Imm = convertUImm8(instruction[1]);
                binary = OpCode + Rdest + Imm;
            }

            // LOAD Assembly format = INST Rdest Raddr
            else if (instruction[0] == "LOAD")
            {
                OpCode = "0100";
                Rdest = convertReg(instruction[1]);
                OpExt = "0000";
                Raddr = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Raddr;
            }

            // STOR Assembly format = INST Rsrc Raddr
            else if (instruction[0] == "STOR")
            {
                OpCode = "0100";
                Rsrc = convertReg(instruction[1]);
                OpExt = "0100";
                Raddr = convertReg(instruction[2]);
                binary = OpCode + Rsrc + OpExt + Raddr;
            }

            // SNXB Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "SNXB")
            {
                OpCode = "0100";
                Rsrc = convertReg(instruction[1]);
                OpExt = "0000";
                Rdest = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Rsrc;
            }

            // ZRXB Assembly format = INST Rsrc Rdest
            else if (instruction[0] == "ZRXB")
            {
                OpCode = "0100";
                Rdest = convertReg(instruction[1]);
                OpExt = "0010";
                Raddr = convertReg(instruction[2]);
                binary = OpCode + Rdest + OpExt + Raddr;
            }

            // SCOND Assembly format = INST Rdest
            else if ((instruction[0] == "SEQ") ||
                     (instruction[0] == "SNE") ||
                     (instruction[0] == "SGE") ||
                     (instruction[0] == "SCS") ||
                     (instruction[0] == "SCC") ||
                     (instruction[0] == "SHI") ||
                     (instruction[0] == "SLS") ||
                     (instruction[0] == "SLO") ||
                     (instruction[0] == "SHS") ||
                     (instruction[0] == "SGT") ||
                     (instruction[0] == "SLE") ||
                     (instruction[0] == "SFS") ||
                     (instruction[0] == "SFC") ||
                     (instruction[0] == "SLT") ||
                     (instruction[0] == "SUC") ||
                     (instruction[0] == "S"))
            {
                String condition = instruction[0].TrimStart('S');
                OpCode = "0100";
                Rdest = convertReg(instruction[1]);
                OpExt = "1101";
                Cond = convertCondition(condition);
                binary = OpCode + Rdest + OpExt + Cond;
            }

            // BCOND Assembly format = INST Label - Automatically calculate branch offsets for a given label
            else if ((instruction[0] == "BEQ") ||
                     (instruction[0] == "BNE") ||
                     (instruction[0] == "BGE") ||
                     (instruction[0] == "BCS") ||
                     (instruction[0] == "BCC") ||
                     (instruction[0] == "BHI") ||
                     (instruction[0] == "BLS") ||
                     (instruction[0] == "BLO") ||
                     (instruction[0] == "BHS") ||
                     (instruction[0] == "BGT") ||
                     (instruction[0] == "BLE") ||
                     (instruction[0] == "BFS") ||
                     (instruction[0] == "BFC") ||
                     (instruction[0] == "BLT") ||
                     (instruction[0] == "BUC") ||
                     (instruction[0] == "B"))
            {
                String condition = instruction[0].TrimStart('B');

                OpCode = "1100";
                if (labels.Contains(instruction[1]))    // Make sure it is a valid label
                {
                    LabelPair labelLocation = (LabelPair)labelList[labels.IndexOf(instruction[1])];
                    Disp = convertDisp8(labelLocation.LineNum, destLineCount);
                }
                else // Treat it as a number displacement
                {
                    int Num;
                    bool isNum = int.TryParse(instruction[1], out Num);
                    if (isNum)
                    {
                        Disp = convertImm8(Num.ToString());
                    }
                    else
                    {
                        Disp = convertImm8(instruction[1]);
                    }
                }
                Cond = convertCondition(condition);
                binary = OpCode + Cond + Disp;
            }
            
            // DI Assembly format = INST
            else if (instruction[0] == "DI")
            {
                binary = "0100000000110000";
            }

            // EI Assembly format = INST
            else if (instruction[0] == "EI")
            {
                binary = "0100000001110000";
            }

            // RETX Assembly format = INST
            else if (instruction[0] == "RETX")
            {
                binary = "0100000010011111";    // Always returns to address in R15 (1111)
            }

            // WAIT Assembly format = INST
            else if (instruction[0] == "WAIT")
            {
                binary = "0000000010010000";
            }

            else binary = "error";

            return binary;
        }

        // Expand a JCond Label instruction into LUI, ORI and JCond instructions
        private String[] jump(String assembly)
        {
            String[] instruction = Regex.Split(assembly, @"\s+");
            String[] binaryLines = { "", "", "" };
            String binary1 = "1111"; // LUI Rdest Imm(from label)
            String binary2 = "0010"; // ORI Rdest Imm
            String binary3 = "0100"; // start of JCond

            if (labels.Contains(instruction[2]))
            {
                String reg = convertReg(instruction[1]);
                binary1 += reg;
                LabelPair labelLocation = (LabelPair)labelList[labels.IndexOf(instruction[2])];
                binary1 += convertUpper8(labelLocation.LineNum); // Imm for LUI

                binary2 += reg;
                binary2 += convertLower8(labelLocation.LineNum); // Imm for ORI

                binary3 += convertCondition(instruction[0].TrimStart('J'));
                binary3 += "1100";
                binary3 += convertReg(instruction[1]);

                binaryLines[0] = binary1;
                binaryLines[1] = binary2;
                binaryLines[2] = binary3;
            }
            else // Generate an error
            {
                binaryLines[0] = "label error";
                binaryLines[1] = "label error";
                binaryLines[2] = "label error";
            }
            return binaryLines;
        }

        // Expand a JAL Label instruction into LUI, ORI and JAL instructions
        private String[] jumpAndLink(String assembly)
        {
            String[] instruction = Regex.Split(assembly, @"\s+");
            String[] binaryLines = { "", "", "" };
            String binary1 = "1111";            // LUI Rdest Imm(from label)
            String binary2 = "0010";            // ORI Rdest Imm
            String binary3 = "010011111000";    // JAL R15 OpExt Rtarget

            if (labels.Contains(instruction[2]))
            {
                String reg = convertReg(instruction[1]);
                binary1 += reg;
                LabelPair labelLocation = (LabelPair)labelList[labels.IndexOf(instruction[2])];
                binary1 += convertUpper8(labelLocation.LineNum); // Imm for LUI

                binary2 += reg;
                binary2 += convertLower8(labelLocation.LineNum); // Imm for ORI

                binary3 += convertReg(instruction[1]);

                binaryLines[0] = binary1;
                binaryLines[1] = binary2;
                binaryLines[2] = binary3;

            }
            else
            {
                binaryLines[0] = "label error";
                binaryLines[1] = "label error";
                binaryLines[2] = "label error";
            }
            return binaryLines;

        }

        // Convert a register into its binary equivalent string
        private String convertReg(String reg)
        {
            String binReg;
            switch (reg)
            {
                case "r0":
                case "R0":
                    binReg = "0000";
                    break;
                case "r1":
                case "R1":
                    binReg = "0001";
                    break;
                case "r2":
                case "R2":
                    binReg = "0010";
                    break;
                case "r3":
                case "R3":
                    binReg = "0011";
                    break;
                case "r4":
                case "R4":
                    binReg = "0100";
                    break;
                case "r5":
                case "R5":
                    binReg = "0101";
                    break;
                case "r6":
                case "R6":
                    binReg = "0110";
                    break;
                case "r7":
                case "R7":
                    binReg = "0111";
                    break;
                case "r8":
                case "R8":
                    binReg = "1000";
                    break;
                case "r9":
                case "R9":
                    binReg = "1001";
                    break;
                case "r10":
                case "R10":
                    binReg = "1010";
                    break;
                case "r11":
                case "R11":
                    binReg = "1011";
                    break;
                case "r12":
                case "R12":
                    binReg = "1100";
                    break;
                case "r13":
                case "R13":
                case "sp":
                    binReg = "1101";
                    break;
                case "r14":
                case "R14":
                case "fp":
                    binReg = "1110";
                    break;
                case "r15":
                case "R15":
                case "ra":
                    binReg = "1111";
                    break;
                default:
                    binReg = "error";
                    break;
            }
            return binReg;
        }

        // Convert a number into a signed 8 bit binary string
        private String convertImm8(String n)
        {
            Int16 num = Convert.ToInt16(n);
            String num8bit = "";
            num8bit += (1 & (num >> 15));
            for (int i = 6; i > -1; i--)
            {
                num8bit += ((num >> i) & 1);
            }
            return num8bit;
        }

        // Convert a number into an unsigned 8 bit binary string
        private String convertUImm8(String n)
        {
            Int16 num = Convert.ToInt16(n);
            String numU8bit = "";
            for (int i = 7; i > -1; i--)
            {
                numU8bit += ((num >> i) & 1);
            }
            return numU8bit;
        }

        // Convert a number into a 4 bit signed binary string
        private String convertImm4(String n)
        {
            Int16 num = Convert.ToInt16(n);
            String num4bit = "";
            num4bit += (1 & (num >> 15));
            for (int i = 2; i > -1; i--)
            {
                num4bit += ((num >> i) & 1);
            }
            return num4bit;
        }

        // Convert Immediate a string of 5 bit 2's compliment number
        private String convertImm5(String n)
        {
            Int16 num = Convert.ToInt16(n);
            String num5bit = "";
            num5bit += (1 & (num >> 15));
            for (int i = 3; i > -1; i--)
            {
                num5bit += ((num >> i) & 1);
            }
            return num5bit;
        }

        // Convert the branch displacement for a label
        private String convertDisp8(int labelLine, int line)
        {
            int dispNum = labelLine - line;
            String disp = "";

            // Verify that it is within 8 bit signed range
            if ((-128 <= dispNum) && (dispNum <= 127))  
            {
                disp += (1 & (dispNum >> 31));
                for (int i = 6; i > -1; i--)
                {
                    disp += ((dispNum >> i) & 1);
                }
            }

            // Generate error if out of range
            else
            {
                disp = "Branch range error";
            }
            return disp;

        }

        // Convert the upper 8 bits of a 16 bit number into a binary string
        private String convertUpper8(int n)
        {
            String Imm = "";
            for (int i = 15; i > 7; i--)
            {
                Imm += ((n >> i) & 1);
            }
            return Imm;
        }

        // Convert the lower 8 bits of a 16 bit number into a binary string
        private String convertLower8(int n)
        {
            String Imm = "";
            for (int i = 7; i > -1; i--)
            {
                Imm += ((n >> i) & 1);
            }
            return Imm;
        }

        // Convert a condition code string into its binary representation string
        private String convertCondition(String c)
        {
            String condition = "";
            switch (c)
            {
                case "EQ":
                    condition = "0000";
                    break;
                case "NE":
                    condition = "0001";
                    break;
                case "GE":
                    condition = "1101";
                    break;
                case "CS":
                    condition = "0010";
                    break;
                case "CC":
                    condition = "0011";
                    break;
                case "HI":
                    condition = "0100";
                    break;
                case "LS":
                    condition = "0101";
                    break;
                case "LO":
                    condition = "1010";
                    break;
                case "HS":
                    condition = "1011";
                    break;
                case "GT":
                    condition = "0110";
                    break;
                case "LE":
                    condition = "0111";
                    break;
                case "FS":
                    condition = "1000";
                    break;
                case "FC":
                    condition = "1001";
                    break;
                case "LT":
                    condition = "1100";
                    break;
                case "UC":
                    condition = "1110";
                    break;
                case "":
                    condition = "1111";
                    break;
                default:
                    condition = "Error";
                    break;
            }
            return condition;
        }

        // Convert a 16 bit binary string into a 4 Hexadecimal character string
        private String convertBinToHex(String str)
        {
            String inst = str;
            if (inst.Length != 16)
            {
                return "error";
            }
            else
            {
                String s;
                String hex = "";
                for (int i = 0; i < 4; i++)
                {
                    s = "";
                    for (int j = 0; j < 4; j++)
                    {
                        s += inst[4*i + j];
                    }
                    hex += binToHex(s);
                }
                if (hex.Length != 4)
                {
                    return "error";
                }
                else
                {
                    return hex;
                }
            }

        }

        // Convert a 4 bit binary string into a Hexadecimal string
        private String binToHex(String binary)
        {
            String hex = "";
            switch (binary)
            {
                case "0000":
                    hex = "0";
                    break;
                case "0001":
                    hex = "1";
                    break;
                case "0010":
                    hex = "2";
                    break;
                case "0011":
                    hex = "3";
                    break;
                case "0100":
                    hex = "4";
                    break;
                case "0101":
                    hex = "5";
                    break;
                case "0110":
                    hex = "6";
                    break;
                case "0111":
                    hex = "7";
                    break;
                case "1000":
                    hex = "8";
                    break;
                case "1001":
                    hex = "9";
                    break;
                case "1010":
                    hex = "A";
                    break;
                case "1011":
                    hex = "B";
                    break;
                case "1100":
                    hex = "C";
                    break;
                case "1101":
                    hex = "D";
                    break;
                case "1110":
                    hex = "E";
                    break;
                case "1111":
                    hex = "F";
                    break;
                default:
                    hex = "error";
                    break;
            }
            return hex;
        }

        // Close the Assembler
        private void closeButton_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        // Clear all textboxes and lists
        private void resetButton_Click(object sender, EventArgs e)
        {
            sourceFileTextBox.Text = "";
            destFileTextBox.Text = "";
            sourceLineTextBox.Text = "";
            convertedLineTextBox.Text = "";
            destHexTextBox.Text = "";
            lineList = new ArrayList();
            labelList = new ArrayList();
            labels = new ArrayList();
            errorList = new ArrayList();
            labelsTextBox.Text = "";
        }



    }

    public class LabelPair
    {
        private String label;
        private int lineNum;

        public LabelPair(String s, int i)
        {
            label = s;
            lineNum = i;
        }

        public String Label
        {
            get
            {
                return label;
            }

            set
            {
                label = value;
            }
        }

        public int LineNum
        {
            get
            {
                return lineNum;
            }

            set
            {
                lineNum = value;
            }
        }

        public String toString()
        {
            return (lineNum + ", " + label);
        }
    }

}