var canvas = document.getElementById('myCanvas');
var context = canvas.getContext('2d');

var styles = {
  defaultFillStyle: '4F81BD',
  hoveredFillStyle: '8FC1FD'
}

var rect1 = {
  x: 103,
  y: 262,
  w: 200,
  h: 100,
  fillStyle: '4F81BD',
  hovered: false
};

var rect2 = {
  x: 484,
  y: 170,
  w: 200,
  h: 100,
  hovered: false
}

var mouseDown = false,
  mouseRect1Offset = null,
  mouseRect2Offset = null,
  cx = 0,
  cy = 0;



  var dragging = false;

  canvas.addEventListener('mousedown', function(e) {
    mouseDown = true;
    mouseRect1Offset = isMouseOverRect(rect1, e.clientX, e.clientY); // What is this?
    mouseRect2Offset = isMouseOverRect(rect2, e.clientX, e.clientY);
  });

function isMouseOverRect (rect, mouseX, mouseY) {
  if (mouseX > rect.x + cx && mouseX < rect.x + cx + rect.w &&
      mouseY > rect.y + cy && mouseY < rect.y + cy + rect.h ) {
    rect.hovered = true;
    rect.fillStyle = styles.hoveredFillStyle;
    return {
    x: mouseX - rect.x, y: mouseY - rect.y
  };}
  else{
    rect.fillStyle = styles.defaultFillStyle;
    return false;
    }
  }

canvas.addEventListener('mouseup', function(e){
  mouseDown = false;
 });

function positionCanvasContext(x, y){
  cx = x;
  cy = y;
  drawBoxes();
}

function drawBoxes() {
  context.clearRect(0,0, canvas.width,canvas.height);
  context.save();
  context.translate(cx, cy);
  drawBezier();
  drawRect(rect1);
  drawRect(rect2);
  context.restore();
}

function drawRect (rect) {
  context.beginPath();
  context.rect(rect.x, rect.y, rect.w, rect.h);
  context.fillStyle = rect.fillStyle;
  context.fill();
  context.lineWidth = 7;
  context.strokeStyle = '456893';
  context.stroke();
}

function drawBezier() {
  context.beginPath();
  context.moveTo(rect2.x + rect2.w/2, rect2.y + rect2.h/2);
  context.bezierCurveTo(534,414,254,118, rect1.x+rect1.w/2, rect1.y +rect1.h/2);
  context.lineWidth = 20;
  context.strokeStyle = 'white';
  context.stroke();
}

canvas.addEventListener('mousemove', function(e) {
  var mouseX = e.clientX;
  var mouseY = e.clientY;

  if (mouseRect1Offset && mouseDown){
    rect1.x = mouseX - mouseRect1Offset.x;
    rect1.y = mouseY -mouseRect1Offset.y;
  }
  if (mouseRect2Offset && mouseDown) {
    rect2.x = mouseX - mouseRect2Offset.x;
    rect2.y = mouseY - mouseRect2Offset.y;
  }

  drawBoxes();
  context.restore();
});

drawBoxes();

var centerX = canvas.width / 2;
var centerY = canvas.height / 2;

$("#box1click").click(function () {
    centerThisRect(rect1);
});
$("#box2click").click(function () {
    centerThisRect(rect2);
});

function centerThisRect(rectangle_number) {
    var r = rectangle_number;
    var offsetX = centerX - r.x - r.w / 2;
    var offsetY = centerY - r.y - r.h / 2;
    positionCanvasContext(offsetX,offsetY)
}