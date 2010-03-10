
void moe() {
    try {
	larry();
	print("woop woop!");
    }
    catch (EyePokeException e1) 
    {
	print(e1.getMessage());
    }
    catch (NoseTweakException e2) 
    {
	print("Why I oughtta...");
    }
    print("beep beep!");
}


















void larry() {
    try {
	curly();
	print("you knucklehead!");

    }
    catch (NoseTweakException e) 
    {
	print("ouch!");
	throw e;
    }
    finally {
	print("zang!");
    }
    print("whap!");
}


















void curly() {
 
    print("boing!");
    throw	 new CreamPieException();
    print("pow!");

}

