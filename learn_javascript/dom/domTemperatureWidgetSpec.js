describe("TemperatureWidget", function() {
	var widget, jasmineContent;
	
	beforeEach(function() {		
		jasmineContent = document.getElementById("jasmine_content");
		// set up some sample HTML in the test page 
		// (backslash is a line contination char)
		jasmineContent.innerHTML = "                                \
<div id='temperatureWidget'>                                      \
  <p>Fahrenheit: <input name='fahrenheit'></p>                  \
  <p>Celcius: <span class='celcius'>???</span></p>                \
  <p><input type='submit' name='convert' value='Convert'></p>   \
</div>";
	
		// create the TemperatureWidget for use in later tests
		widget = new TemperatureWidget();
	});

	it("can locate the widget element", function() {
		expect(widget.widgetElement.id).toEqual('temperatureWidget');
		expect(widget.widgetElement instanceof HTMLElement).toBeTruthy();
	});
	
	it("can locate the fahrenheit element", function() {
		expect(widget.fahrenheit.nodeName).toEqual('INPUT');
		expect(widget.fahrenheit.name).toEqual('fahrenheit');
	});

	it("can locate the celcius element", function() {
		expect(widget.celcius.nodeName).toEqual('SPAN');
		expect(widget.celcius.className).toEqual('celcius');
	});
	
	it("can locate the convert button", function() {
		expect(widget.convertButton.nodeName).toEqual('INPUT');
		expect(widget.convertButton.type).toEqual('submit');
	});

	it("can convert from fahrenheit to celcius", function() {
		widget.fahrenheit.value = "32";
		widget.convert();
		expect(widget.celcius.innerHTML).toEqual("0");		
	});
		
	it("converts when we click the button", function() {
		// helper function to allow many similar tests in a row
		function setAndConvert(f) {
			widget.fahrenheit.value = f;
			widget.convertButton.click();
			return widget.celcius.innerHTML;
		}
		expect(setAndConvert(32)).toEqual("0");
		expect(setAndConvert(212)).toEqual("100");
		expect(setAndConvert(20)).toEqual("-7");
		expect(setAndConvert(40)).toEqual("4");
	});

	describe("color gradient", function() {
		var freezing = new Color(208, 230, 254);
		var boiling = new Color(255, 50, 65);
		
		it("calculates an appropriate color for when it's cold", function() {
			expect(widget.colorFor(0)).toEqual(freezing.toHex());
		});

		it("calculates an appropriate color for when it's hot", function() {
			expect(widget.colorFor(100)).toEqual(boiling.toHex());
		});

		it("sets the background color after conversion", function() {
			widget.fahrenheit.value = 212;
			widget.convertButton.click();
			window.console.log(widget.widgetElement.style.backgroundColor);
			var bg = widget.widgetElement.style.backgroundColor;
			expect(bg).toEqual("rgb(255, 50, 65)"); // yes, it's a string :-(
		});
	});

});
