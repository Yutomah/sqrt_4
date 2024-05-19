using Godot;
using System;
using System.Globalization;
using System.Numerics;

public partial class sqrt_computator : Node2D
{
    public override void _Ready()
    {
        // Called every time the node is added to the scene.
        // Initialization here.
        GD.Print("Hello from C# to Godot :)");
        tests_for_common();
        tests_for_complex();
        tests_for_long();
        
    }
    public string get_common_sqrt(double num){
        return Convert.ToString(Math.Sqrt(num));
    }
    public string is_valid_common_sqrt(string num){
        if(num.Length > 1 && num[0] == '0' && num[1] == '0')
            return "incorect";
        if(num == "")
            return "valid";

        double result;

        if(!Double.TryParse(num, new NumberFormatInfo(){NumberDecimalSeparator = ".", NumberGroupSeparator = ""}, out result))
            return "incorect";
        
        //GD.Print("infinity?", Double.IsInfinity(result), result);
        // if(Double.IsInfinity(result))
        //     return false;
        
        if(result >= 0)
            return "valid";
        
        return "negative";
    }



    public string get_bignum_sqrt(string num, int int_prec){
        string str_prec = "F"+Convert.ToString(int_prec);

        BigRational bigRational = BigRational.Parse(num);
        bigRational = BigRational.Sqrt(bigRational, int_prec);
        return bigRational.ToString(str_prec);
    }
    public string is_valid_bignum_sqrt(string num){
        
        if(num == "")
            return "valid";

        BigRational result;
        if(!BigRational.TryParse(num, 
            new NumberFormatInfo(){NumberDecimalSeparator = ".", NumberGroupSeparator = ""}, out result))
            return "incorect";

        if(result >= 0)
            return "valid";
        
        return "negative";
    }




    public Godot.Collections.Array<string> get_complex_sqrt(double real, double imaginary)
    {
        Complex num = new Complex(real, imaginary);
        num = Complex.Sqrt(num);
        string real_part = num.Real.ToString();
        string imaginary_part = num.Imaginary.ToString();
        return new Godot.Collections.Array<string>(){real_part, imaginary_part};
    }
    public bool is_valid_complex_sqrt(string num){
        if(num.Length > 1 && num[0] == '0' && num[1] == '0')
            return false;

        if(num == "" || num == "-")
            return true;
        
        double result;
        if(!Double.TryParse(num, 
            new NumberFormatInfo(){NumberDecimalSeparator = ".", NumberGroupSeparator = ""}, out result))
            return false;

        return true;
        // return Double.IsFinite(result);
    }

    public void tests_for_common(){
        GD.Print("\n\n\n\nТест на обычные корни");
        GD.Print("Тест на ввод корректного числа должен вернуть valid - ", is_valid_common_sqrt("123.225") == "valid");
        GD.Print("Тест на ввод корректного отрицательного числа должен вернуть negative - ", is_valid_common_sqrt("-123.225") == "negative");
        GD.Print("Тест на ввод огромного числа числа должен вернуть valid - ","valid" == is_valid_common_sqrt("125719287592175921142378659238745983274986342798573984276983275982347689732498573948257928347598327459837249857239846793428759832469832795863249857342986983247598347698349587349867439857983476983478957346839875983467923857394867928347598347698234759834698237598364295982543464362226262666636346346346442973824769843274896732849679328476938274698327496873489672893453279874698237623967392876938243637.124832759832759832745983279486739284529353126126121"));
        GD.Print("Тест на ввод числа с некоректными символами должен вернуть incorect - ",is_valid_common_sqrt("a123.225") == "incorect");
        GD.Print("Тест на ввод корректного числа с запятой вместо точки, должен вернуть incorect - ",is_valid_common_sqrt("123,225") == "incorect");
        GD.Print("Тест на ввод корректного числа c 2 точками, должен вернуть incorect - ",is_valid_common_sqrt("123..225") == "incorect");
    }

    public void tests_for_complex(){
        GD.Print("\n\n\n\nТест на комплексные корни");
        GD.Print("Тест на ввод корректного числа должен вернуть true - ", is_valid_complex_sqrt("123.225") == true);
        GD.Print("Тест на ввод корректного отрицательного числа должен вернуть true - ", is_valid_complex_sqrt("-123.225") == true);
        GD.Print("Тест на ввод огромного числа числа должен вернуть true - ", true == is_valid_complex_sqrt("125719287592175921142378659238745983274986342798573984276983275982347689732498573948257928347598327459837249857239846793428759832469832795863249857342986983247598347698349587349867439857983476983478957346839875983467923857394867928347598347698234759834698237598364295982543464362226262666636346346346442973824769843274896732849679328476938274698327496873489672893453279874698237623967392876938243637.124832759832759832745983279486739284529353126126121"));
        GD.Print("Тест на ввод числа с некоректными символами, должен вернуть false - ",is_valid_complex_sqrt("a123.225") == false);
        GD.Print("Тест на ввод корректного числа с запятой вместо точки, должен вернуть false - ",is_valid_complex_sqrt("123,225") == false);
        GD.Print("Тест на ввод корректного числа c 2 точками, должен вернуть false - ",is_valid_complex_sqrt("123..225") == false);
    }

    public void tests_for_long(){
        GD.Print("\n\n\n\nТест на длинные корни");
        GD.Print("Тест на ввод корректного числа должен вернуть valid - ", is_valid_bignum_sqrt("123.225") == "valid");
        GD.Print("Тест на ввод корректного отрицательного числа должен вернуть negative - ", is_valid_bignum_sqrt("-123.225") == "negative");
        GD.Print("Тест на ввод огромного числа числа должен вернуть valid - ","valid" == is_valid_bignum_sqrt("125719287592175921142378659238745983274986342798573984276983275982347689732498573948257928347598327459837249857239846793428759832469832795863249857342986983247598347698349587349867439857983476983478957346839875983467923857394867928347598347698234759834698237598364295982543464362226262666636346346346442973824769843274896732849679328476938274698327496873489672893453279874698237623967392876938243637.124832759832759832745983279486739284529353126126121"));
        GD.Print("Тест на ввод числа с некоректными символами должен вернуть incorect - ",is_valid_bignum_sqrt("a123.225") == "incorect");
        GD.Print("Тест на ввод корректного числа с запятой вместо точки, должен вернуть incorect - ",is_valid_bignum_sqrt("123,225") == "incorect");
        GD.Print("Тест на ввод корректного числа c 2 точками, должен вернуть incorect - ",is_valid_bignum_sqrt("123..225") == "incorect");
    }

}
