var blockWidth = 100;
var blockHeight = 100;
var maxColumn = 3;
var maxRow = 5;
var maxIndex = maxColumn * maxRow;
var board = new Array(maxIndex);
var component;
var leftScreenPadding = 20;
var topScreenPadding = 20;

const dataArray = [
  {
    name: "alarm",
    img: "resources/pics/im1.png",
    imgId: 1,
  },
  {
    name: "book",
    img: "resources/pics/book.png",
    imgId: 2,
  },
  {
    name: "card-game",
    img: "resources/pics/card-game.png",
    imgId: 3,
  },
  {
    name: "card-games",
    img: "resources/pics/card-games.png",
    imgId: 4,
  },
  {
    name: "checker-board",
    img: "resources/pics/checker-board.png",
    imgId: 5,
  },
  {
    name: "confrontation",
    img: "resources/pics/confrontation.png",
    imgId: 6,
  },
  {
    name: "cover",
    img: "resources/pics/cover.png",
    imgId: 7,
  },
  {
    name: "diamond",
    img: "resources/pics/diamond.png",
    imgId: 8,
  },
  {
    name: "alarm-clock",
    img: "resources/pics/alarm-clock.png",
    imgId: 9,
  },
  {
    name: "edit",
    img: "resources/pics/edit.png",
    imgId: 10,
  },
  {
    name: "game",
    img: "resources/pics/game.png",
    imgId: 11,
  },
  {
    name: "hourglass",
    img: "resources/pics/hourglass.png",
    imgId: 12,
  },
  {
    name: "like",
    img: "resources/pics/like.png",
    imgId: 13,
  },
  {
    name: "photo-camera",
    img: "resources/pics/photo-camera.png",
    imgId: 14,
  },
  {
    name: "roller-skate",
    img: "resources/pics/roller-skate.png",
    imgId: 15,
  },
  {
    name: "star",
    img: "resources/pics/star.png",
    imgId: 16,
  },
  {
    name: "train",
    img: "resources/pics/train.png",
    imgId: 17,
  },
  {
    name: "car",
    img: "resources/pics/car.png",
    imgId: 18,
  },
  {
    name: "globe",
    img: "resources/pics/globe.png",
    imgId: 19,
  },
  {
    name: "cpp",
    img: "resources/pics/cpp.png",
    imgId: 20,
  },
  {
    name: "air-hot-balloon",
    img: "resources/pics/air-hot-balloon.png",
    imgId: 21,
  },
  {
    name: "woman",
    img: "resources/pics/woman.png",
    imgId: 22,
  },
  {
    name: "fan",
    img: "resources/pics/fan.png",
    imgId: 23,
  },
  {
    name: "hawaiian-shirt",
    img: "resources/pics/hawaiian-shirt.png",
    imgId: 24,
  },
];

var cardArray = duplicateCards();

//Index function used instead of a 2D array
function index(column, row) {
  return column + row * maxColumn;
}

function startNewGame() {
  setupGameData();
  cleanBoard();
  calculateBoadSizes();
  initializeGameTiles();
}

function redraw() {
  //   cleanBoard();
  calculateBoadSizes();
  redrawBlocks();
}

function redrawBlocks() {
  for (var column = 0; column < maxColumn; column++) {
    for (var row = 0; row < maxRow; row++) {
      var indexVal = index(column, row);
      if (indexVal >= cardArray.length) {
        break;
      }
      var card = board[indexVal];
      redrawBlock(column, row, indexVal);
    }
  }
}

function setupGameData() {
  cardArray.sort(() => 0.5 - Math.random());
}

function duplicateCards() {
  return dataArray.concat(dataArray.slice());
}

function initializeGameTiles() {
  board = new Array(cardArray.length);

  for (var column = 0; column < maxColumn; column++) {
    for (var row = 0; row < maxRow; row++) {
      var indexVal = index(column, row);
      if (indexVal >= cardArray.length) {
        break;
      }
      board[indexVal] = null;
      var card = cardArray[indexVal];
      createBlock(column, row, card.img, indexVal, card.imgId);
    }
  }
}

function calculateBoadSizes() {
  leftScreenPadding = background.width / 8;
  topScreenPadding = background.height / 10;
  blockWidth = leftScreenPadding;
  blockHeight = topScreenPadding;
  maxColumn = Math.floor(
    (background.width - leftScreenPadding * 2) / blockWidth
  );
  maxRow = Math.floor((background.height - topScreenPadding * 2) / blockHeight);
  maxIndex = maxRow * maxColumn;
}

function cleanBoard() {
  for (var i = 0; i < maxIndex; i++) {
    if (board[i] != null) board[i].destroy();
  }
}

function redrawBlock(column, row, indexVal) {
  var card = board[indexVal];

  if (component.status == Component.Ready) {
    card.x = column * blockWidth + leftScreenPadding;
    card.y = row * blockHeight + topScreenPadding;
    card.width = blockWidth;
    card.height = blockHeight;
  } else {
    console.log("error loading block component");
    console.log(component.errorString());
    return false;
  }
  return true;
}

function createBlock(column, row, imagePath, dataId, imgId) {
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
    dynamicObject.x = column * blockWidth + leftScreenPadding;
    dynamicObject.y = row * blockHeight + topScreenPadding;
    dynamicObject.width = blockWidth;
    dynamicObject.height = blockHeight;
    dynamicObject.activeImage = imagePath;
    dynamicObject.dataId = dataId;
    dynamicObject.imgId = imgId;
    board[index(column, row)] = dynamicObject;
  } else {
    console.log("error loading block component");
    console.log(component.errorString());
    return false;
  }
  return true;
}
