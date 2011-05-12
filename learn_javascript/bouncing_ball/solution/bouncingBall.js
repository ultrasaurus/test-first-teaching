/* solution by Sean Durham sean@sdurham.net */

var BouncingBall = function(arena) {
  
  this.div;
  
  this.height = 10;
  this.width = 10;
  this.x = 0;
  this.y = 0;
  this.velocity = 10;
  this.frame_duration = 100;
  
  var y_orientation = 1;
  var x_orientation = 1;
  
  var frame_timer;
  
  this.color = "#FF0000";

  var self = this;
  this.move = function(){
  
    // if ball is at right edge, bounce left
    if(self.x >= arena.offsetWidth - self.width) { x_orientation = -1 }
    
    // if ball is at left edge, bounce right
    if(self.x < 0) { x_orientation = 1 }
    
    // if ball is at bottom edge, bounce up
    if(self.y >= arena.offsetHeight - self.height) { y_orientation = -1 }

    // if ball is at top edge, bounce down
    if(self.y < 0) { y_orientation = 1 }
    
    // move this ball according to it's velocity
    self.x += (self.velocity * x_orientation);
    self.y += (self.velocity * y_orientation);
    
    // push internal model to visible element
    self.refreshView();
    
    // set timer to
    self.start();
  }
  
  this.start = function(){
    frame_timer = setTimeout(self.move, self.frame_duration)
  }
  
  this.stop = function(){
    clearTimeout(frame_timer);
  }
  
  this.destroy = function(){
    this.stop();
    arena.removeChild(this.div);
  }
  
  this.refreshView = function(){
    this.div.style.height = px(this.height);
    this.div.style.width = px(this.width);
    this.div.style.left = px(this.x);
    this.div.style.top = px(this.y);
    this.div.style.backgroundColor = this.color;
  }
  
  function px(measure){
    return measure.toString() + "px";
  }
  
  // setup  
  this.div = document.createElement('div');
  this.div.className = "ball";
  arena.appendChild(this.div);
  this.refreshView();
}