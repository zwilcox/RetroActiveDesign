namespace AssemblerXP
{
    partial class ErrorForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.errorFlowLayoutPanel = new System.Windows.Forms.FlowLayoutPanel();
            this.errorLabel = new System.Windows.Forms.Label();
            this.headingsLabel = new System.Windows.Forms.Label();
            this.errorTextBox = new System.Windows.Forms.TextBox();
            this.flowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            this.closeButton = new System.Windows.Forms.Button();
            this.saveFlowLayoutPanel = new System.Windows.Forms.FlowLayoutPanel();
            this.saveLabel = new System.Windows.Forms.Label();
            this.saveLabel1 = new System.Windows.Forms.Label();
            this.saveFileTextBox = new System.Windows.Forms.TextBox();
            this.setSaveFileButton = new System.Windows.Forms.Button();
            this.saveButton = new System.Windows.Forms.Button();
            this.setSaveOpenFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.tableLayoutPanel1.SuspendLayout();
            this.errorFlowLayoutPanel.SuspendLayout();
            this.flowLayoutPanel1.SuspendLayout();
            this.saveFlowLayoutPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 265F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 100F));
            this.tableLayoutPanel1.Controls.Add(this.errorFlowLayoutPanel, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.flowLayoutPanel1, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.saveFlowLayoutPanel, 1, 0);
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 79.62963F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.37037F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(440, 270);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // errorFlowLayoutPanel
            // 
            this.errorFlowLayoutPanel.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.errorFlowLayoutPanel.Controls.Add(this.errorLabel);
            this.errorFlowLayoutPanel.Controls.Add(this.headingsLabel);
            this.errorFlowLayoutPanel.Controls.Add(this.errorTextBox);
            this.errorFlowLayoutPanel.FlowDirection = System.Windows.Forms.FlowDirection.TopDown;
            this.errorFlowLayoutPanel.Location = new System.Drawing.Point(9, 3);
            this.errorFlowLayoutPanel.Name = "errorFlowLayoutPanel";
            this.tableLayoutPanel1.SetRowSpan(this.errorFlowLayoutPanel, 2);
            this.errorFlowLayoutPanel.Size = new System.Drawing.Size(247, 264);
            this.errorFlowLayoutPanel.TabIndex = 0;
            // 
            // errorLabel
            // 
            this.errorLabel.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.errorLabel.AutoSize = true;
            this.errorLabel.Location = new System.Drawing.Point(89, 0);
            this.errorLabel.Name = "errorLabel";
            this.errorLabel.Size = new System.Drawing.Size(70, 13);
            this.errorLabel.TabIndex = 0;
            this.errorLabel.Text = "Errors Found:";
            // 
            // headingsLabel
            // 
            this.headingsLabel.AutoSize = true;
            this.headingsLabel.Location = new System.Drawing.Point(3, 28);
            this.headingsLabel.Margin = new System.Windows.Forms.Padding(3, 15, 3, 0);
            this.headingsLabel.Name = "headingsLabel";
            this.headingsLabel.Size = new System.Drawing.Size(103, 13);
            this.headingsLabel.TabIndex = 2;
            this.headingsLabel.Text = "Line         Instruction";
            // 
            // errorTextBox
            // 
            this.errorTextBox.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.errorTextBox.Location = new System.Drawing.Point(3, 44);
            this.errorTextBox.Multiline = true;
            this.errorTextBox.Name = "errorTextBox";
            this.errorTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.errorTextBox.Size = new System.Drawing.Size(243, 217);
            this.errorTextBox.TabIndex = 1;
            this.errorTextBox.WordWrap = false;
            // 
            // flowLayoutPanel1
            // 
            this.flowLayoutPanel1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.flowLayoutPanel1.Controls.Add(this.closeButton);
            this.flowLayoutPanel1.FlowDirection = System.Windows.Forms.FlowDirection.TopDown;
            this.flowLayoutPanel1.Location = new System.Drawing.Point(312, 228);
            this.flowLayoutPanel1.Name = "flowLayoutPanel1";
            this.flowLayoutPanel1.Size = new System.Drawing.Size(81, 29);
            this.flowLayoutPanel1.TabIndex = 2;
            // 
            // closeButton
            // 
            this.closeButton.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.closeButton.Location = new System.Drawing.Point(3, 3);
            this.closeButton.Name = "closeButton";
            this.closeButton.Size = new System.Drawing.Size(75, 23);
            this.closeButton.TabIndex = 1;
            this.closeButton.Text = "Close";
            this.closeButton.UseVisualStyleBackColor = true;
            this.closeButton.Click += new System.EventHandler(this.closeButton_Click);
            // 
            // saveFlowLayoutPanel
            // 
            this.saveFlowLayoutPanel.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.saveFlowLayoutPanel.Controls.Add(this.saveLabel);
            this.saveFlowLayoutPanel.Controls.Add(this.saveLabel1);
            this.saveFlowLayoutPanel.Controls.Add(this.saveFileTextBox);
            this.saveFlowLayoutPanel.Controls.Add(this.setSaveFileButton);
            this.saveFlowLayoutPanel.Controls.Add(this.saveButton);
            this.saveFlowLayoutPanel.FlowDirection = System.Windows.Forms.FlowDirection.TopDown;
            this.saveFlowLayoutPanel.Location = new System.Drawing.Point(268, 16);
            this.saveFlowLayoutPanel.Name = "saveFlowLayoutPanel";
            this.saveFlowLayoutPanel.Size = new System.Drawing.Size(169, 183);
            this.saveFlowLayoutPanel.TabIndex = 3;
            // 
            // saveLabel
            // 
            this.saveLabel.AutoSize = true;
            this.saveLabel.Location = new System.Drawing.Point(3, 0);
            this.saveLabel.Name = "saveLabel";
            this.saveLabel.Size = new System.Drawing.Size(0, 13);
            this.saveLabel.TabIndex = 0;
            // 
            // saveLabel1
            // 
            this.saveLabel1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.saveLabel1.AutoSize = true;
            this.saveLabel1.Location = new System.Drawing.Point(47, 13);
            this.saveLabel1.Name = "saveLabel1";
            this.saveLabel1.Size = new System.Drawing.Size(78, 13);
            this.saveLabel1.TabIndex = 1;
            this.saveLabel1.Text = "Save Error Log";
            this.saveLabel1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // saveFileTextBox
            // 
            this.saveFileTextBox.Location = new System.Drawing.Point(3, 29);
            this.saveFileTextBox.Name = "saveFileTextBox";
            this.saveFileTextBox.Size = new System.Drawing.Size(166, 20);
            this.saveFileTextBox.TabIndex = 2;
            // 
            // setSaveFileButton
            // 
            this.setSaveFileButton.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.setSaveFileButton.Location = new System.Drawing.Point(46, 55);
            this.setSaveFileButton.Name = "setSaveFileButton";
            this.setSaveFileButton.Size = new System.Drawing.Size(80, 23);
            this.setSaveFileButton.TabIndex = 4;
            this.setSaveFileButton.Text = "Set Save File";
            this.setSaveFileButton.UseVisualStyleBackColor = true;
            this.setSaveFileButton.Click += new System.EventHandler(this.setSaveFileButton_Click);
            // 
            // saveButton
            // 
            this.saveButton.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.saveButton.Location = new System.Drawing.Point(48, 111);
            this.saveButton.Margin = new System.Windows.Forms.Padding(3, 30, 3, 3);
            this.saveButton.Name = "saveButton";
            this.saveButton.Size = new System.Drawing.Size(75, 23);
            this.saveButton.TabIndex = 3;
            this.saveButton.Text = "Save";
            this.saveButton.UseVisualStyleBackColor = true;
            this.saveButton.Click += new System.EventHandler(this.saveButton_Click);
            // 
            // setSaveOpenFileDialog
            // 
            this.setSaveOpenFileDialog.FileName = "openFileDialog1";
            // 
            // ErrorForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(452, 271);
            this.Controls.Add(this.tableLayoutPanel1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ErrorForm";
            this.Text = "Errors Found!";
            this.TopMost = true;
            this.tableLayoutPanel1.ResumeLayout(false);
            this.errorFlowLayoutPanel.ResumeLayout(false);
            this.errorFlowLayoutPanel.PerformLayout();
            this.flowLayoutPanel1.ResumeLayout(false);
            this.saveFlowLayoutPanel.ResumeLayout(false);
            this.saveFlowLayoutPanel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.FlowLayoutPanel errorFlowLayoutPanel;
        private System.Windows.Forms.Label errorLabel;
        public System.Windows.Forms.TextBox errorTextBox;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel1;
        private System.Windows.Forms.Button closeButton;
        private System.Windows.Forms.FlowLayoutPanel saveFlowLayoutPanel;
        private System.Windows.Forms.Label saveLabel;
        private System.Windows.Forms.Label saveLabel1;
        private System.Windows.Forms.TextBox saveFileTextBox;
        private System.Windows.Forms.Button saveButton;
        private System.Windows.Forms.Label headingsLabel;
        private System.Windows.Forms.Button setSaveFileButton;
        private System.Windows.Forms.OpenFileDialog setSaveOpenFileDialog;
    }
}