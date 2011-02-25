function BouncingBall(arena) {
	this.div = document.createElement("div");
	arena.appendChild(this.div);

	this.height = 10;
	this.width = 10;
	this.color = "#FF0000";
	this.x = 0;
	this.y = 0;
	
	this.div.style.height = this.height + "px";
	this.div.style.width = this.width + "px";
	this.div.style.backgroundColor = this.color;
	this.div.style.top = this.x + "px";
	this.div.style.left = this.y + "px";
	
}
