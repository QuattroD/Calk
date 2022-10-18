using System;
using System.Data;
namespace Calk
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        int otvet;
        int y;

        List<int> result = new List<int>();
        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Text += button1.Text;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text += button2.Text;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox1.Text += button3.Text;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            textBox1.Text += button4.Text;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            textBox1.Text += button5.Text;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            textBox1.Text += button6.Text;
        }

        private void button7_Click(object sender, EventArgs e)
        {
            textBox1.Text += button7.Text;
        }

        private void button8_Click(object sender, EventArgs e)
        {
            textBox1.Text += button8.Text;
        }

        private void button9_Click(object sender, EventArgs e)
        {
            textBox1.Text += button9.Text;
        }

        private void button0_Click(object sender, EventArgs e)
        {
            textBox1.Text += button0.Text;
        }

        private void btnremove_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            result.Clear();
            otvet = 0;
        }

        private void btnsum_Click(object sender, EventArgs e)
        {
            textBox1.Text += "+";
        }

        public void btnravno_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            otvet = Convert.ToInt32(new DataTable().Compute(textBox1.Text, null));
            y = random.Next(0, 1000000);

            if (otvet == y)
            {
                y = random.Next(0, 100000);
            }
            else
            {
                result.Add(y);
            }

            foreach(var item in result)
            {
                if (item == y)
                {
                    y = random.Next(0, 100000);
                }
                else
                {
                    result.Add(y);
                }
            }
            MessageBox.Show(y.ToString());
        }

        
        public void btnmin_Click(object sender, EventArgs e)
        {
            textBox1.Text += "-";
        }

        public void btnmom_Click(object sender, EventArgs e)
        {
            textBox1.Text += "*";
        }

        public void btndel_Click(object sender, EventArgs e)
        {
            textBox1.Text += "/";
        }
    }
}