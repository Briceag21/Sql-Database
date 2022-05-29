using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp3
{
    public partial class Form1 : Form
    {

       
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string tipulInstalarii;
            if (radioButton1.Checked)
                tipulInstalarii = "Limitat";
            else
                tipulInstalarii = "Complet";

            string optiuni = null;
            if (checkBox1.Checked)
                optiuni = "Optiuni extinse";

            listBox1.Items.Add("Tipul instalarii: " + tipulInstalarii);
            if (optiuni != null)
                listBox1.Items.Add(optiuni);

            listBox1.Items.Add("Nume: " + textBox2.Text);
            listBox1.Items.Add("PIN1: " + textBox3.Text);
            listBox1.Items.Add("PIN2: " + textBox1.Text);
            listBox1.Items.Add("Limba: " + comboBox1.Text);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
