using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace AssemblerXP
{
    /*
     * This class is used for Error Reporting
     * It is called and populated by the main AssemblerXP form
     */
    public partial class ErrorForm : Form
    {
        public ErrorForm()
        {
            InitializeComponent();
        }

        private void setSaveFileButton_Click(object sender, EventArgs e)
        {
            if (setSaveOpenFileDialog.ShowDialog() == DialogResult.OK)
            {
                saveFileTextBox.Text = setSaveOpenFileDialog.FileName;
            }
        }

        // Allows user to save error output to a file
        private void saveButton_Click(object sender, EventArgs e)
        {
            // Make sure a file has been selected
            if (saveFileTextBox.Text == "")
            {
                MessageBox.Show("Please Enter a Destination File", "File Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            else
            {
                // Check to see if save file exists,
                // Create it if it doesn't, ask to overwrite if it does
                if (File.Exists(saveFileTextBox.Text))
                {
                    DialogResult result = MessageBox.Show(saveFileTextBox.Text +
                        " already exists.  Do you want to overwrite it?", "Overwrite File?",
                        MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                    if (result == DialogResult.Yes)
                    {
                        File.Delete(saveFileTextBox.Text);
                    }
                    else
                    {
                        return;
                    }

                }
            }

            // Output error list to file
            using (StreamWriter saveFile = File.CreateText(saveFileTextBox.Text))
            {
                saveFile.Write(saveFileTextBox.Text);
                saveFile.Close();
            }
            
        }

        // Close the form
        private void closeButton_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
