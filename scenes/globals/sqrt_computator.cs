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
        GD.Print(get_common_sqrt(123));
        GD.Print(get_bignum_sqrt("12312351235123416123451.2222222", 20));
        GD.Print(get_complex_sqrt(22.2, 15.5));
        GD.Print(is_valid_common_sqrt("123.225"));
        GD.Print(is_valid_common_sqrt("-123.225"));
        GD.Print(is_valid_common_sqrt("125719287592175921142378659238745983274986342798573984276983275982347689732498573948257928347598327459837249857239846793428759832469832795863249857342986983247598347698349587349867439857983476983478957346839875983467923857394867928347598347698234759834698237598364295982543464362226262666636346346346442973824769843274896732849679328476938274698327496873489672893453279874698237623967392876938243637.124832759832759832745983279486739284529353126126121"));
        GD.Print(get_common_sqrt(125719287592175921198257.1253126126121));
        GD.Print(is_valid_common_sqrt("a123.225"));
        GD.Print(is_valid_common_sqrt("123,225"));
        GD.Print(is_valid_common_sqrt("123.225"));
        
    }
    public string get_common_sqrt(double num){
        return Convert.ToString(Math.Sqrt(num));
    }
    public string is_valid_common_sqrt(string num){
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
        else
            return "negative";
    }



    public string get_bignum_sqrt(string num, int int_prec){
        string str_prec = "F"+Convert.ToString(int_prec);

        BigRational bigRational = BigRational.Parse(num);
        bigRational = BigRational.Sqrt(bigRational, int_prec);
        return bigRational.ToString(str_prec);
    }
    public bool is_valid_bignum_sqrt(string num){
        BigRational result;
        return BigRational.TryParse(num, 
            new NumberFormatInfo(){NumberDecimalSeparator = "."}, out result);
    }




    public string get_complex_sqrt(double real, double imaginary)
    {
        Complex num = new Complex(real, imaginary);
        num = Complex.Sqrt(num);
        return num.ToString();
    }
    public bool is_valid_complex_sqrt(string num){
        double result;

        if(!Double.TryParse(num, new NumberFormatInfo(){NumberDecimalSeparator = "."}, out result))
            return false;

        return true;
        // return Double.IsFinite(result);
    }

}
