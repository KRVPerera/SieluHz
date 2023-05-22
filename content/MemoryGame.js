var blockSize = 70;
var maxColumn = 3;
var maxRow = 5;
var maxIndex = maxColumn * maxRow;
var board = new Array(maxIndex);
var component;

//Index function used instead of a 2D array
function index(column, row) {
  return column + row * maxColumn;
}

function startNewGame() {
  cleanBoard();
  calculateBoadSizes();
  initializeGameTiles();
}

function initializeGameTiles() {
  board = new Array(maxIndex);
  for (var column = 0; column < maxColumn; column++) {
    for (var row = 0; row < maxRow; row++) {
      board[index(column, row)] = null;
      createBlock(column, row);
    }
  }
}

function calculateBoadSizes() {
  maxColumn = Math.floor(background.width / blockSize);
  maxRow = Math.floor(background.height / blockSize);
  maxIndex = maxRow * maxColumn;
}

function cleanBoard() {
  for (var i = 0; i < maxIndex; i++) {
    if (board[i] != null) board[i].destroy();
  }
}

function createBlock(column, row) {
  if (component == null) component = Qt.createComponent("MemoryBlock.qml");

  // Note that if Block.qml was not a local file, component.status would be
  // Loading and we should wait for the component's statusChanged() signal to
  // know when the file is downloaded and ready before calling createObject().
  if (component.status == Component.Ready) {
    var dynamicObject = component.createObject(background);
    if (dynamicObject == null) {
      console.log("error creating block");
      console.log(component.errorString());
      return false;
    }
    dynamicObject.x = column * blockSize;
    dynamicObject.y = row * blockSize;
    dynamicObject.width = blockSize;
    dynamicObject.height = blockSize;
    dynamicObject.activeImage = "resources/pics/like.png";
    board[index(column, row)] = dynamicObject;
  } else {
    console.log("error loading block component");
    console.log(component.errorString());
    return false;
  }
  return true;
}
