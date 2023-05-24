.pragma library
var blockWidth = 100;
var blockHeight = 100;
var maxColumn = 3;
var maxRow = 5;
var maxIndex = maxColumn * maxRow;
var board = new Array(maxIndex);
var component;
var leftAndRightScreenPadding = 20;
var topAndBottomScreenPadding = 20;

const tilesPerRow = 6;
const tilesPerColumn = 8;
const columnGridSize = 68;
const rowGridSize = 90;

var imagesChosen = [];
var cardsChosenId = [];
var cardsWon = [];
var isFlipping = false;
var prevCardId = -1;
var scoreValue = 0;
var won = false;

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

function handleClick(newIndex, imgId) {
  var currentClickedCardId = newIndex;
  var iamgeId = imgId;

  console.log(
    "Cliked imgId : ",
    iamgeId,
    " new index : ",
    currentClickedCardId
  );

  console.log("isFlipping : ", isFlipping);
  if (isFlipping) {
    return;
  }

  if (prevCardId === currentClickedCardId) {
    console.log("prevCardId === currentClickedCardId");
    prevCardId = -1;
    imagesChosen = [];
    cardsChosenId = [];
    return;
  }

  console.log("Need to do check match");
  console.log(currentClickedCardId);
  console.log(prevCardId);
  prevCardId = currentClickedCardId;
  cardsChosenId.push(currentClickedCardId);
  imagesChosen.push(iamgeId);

  console.log(cardsChosenId);
  console.log(imagesChosen);
  if (imagesChosen.length === 2) {
    isFlipping = true;
    checkForMatch();
    isFlipping = false;
  }
}

function checkForMatch() {
  const optionOneImageId = imagesChosen[0];
  const optionTwoImageId = imagesChosen[1];
  var choosenFirstCardId = cardsChosenId[0];
  var choosenSecondCardId = cardsChosenId[1];
  var firstCard = board[choosenFirstCardId];
  var secondCard = board[choosenSecondCardId];
  if (optionOneImageId === optionTwoImageId) {
    firstCard.isSolved = true;
    secondCard.isSolved = true;
    cardsWon.push(optionTwoImageId);
  } else {
    firstCard.isActive = false;
    secondCard.isActive = false;
  }

  imagesChosen = [];
  cardsChosenId = [];
  scoreValue = cardsWon.length;
  //   score.text = cardsWon.length;
  if (cardsWon.length === cardArray.length / 2) {
    won = true;
    console.log("Congratulations! You found them all");
  }
}

function index(column, row) {
  return column + row * maxColumn;
}

function startNewGame(backgroundWidth, backgroundHeight, background) {
  setupGameData();
  cleanBoard();
  calculateBoadSizes(backgroundWidth, backgroundHeight);
  initializeGameTiles(background);
}

function redraw(backgroundWidth, backgroundHeight) {
  calculateBoadSizes(backgroundWidth, backgroundHeight);
  redrawBlocks();
}

function flipCardFunction() {
  this.isActive = !this.isActive;
  console.log("Cliked imgId : ", this.imgId, " ID: ", this.dataId);
}

function redrawBlocks() {
  for (var column = 0; column < maxColumn; column++) {
    for (var row = 0; row < maxRow; row++) {
      var indexVal = index(column, row);
      if (indexVal >= cardArray.length) {
        break;
      }
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

function initializeGameTiles(background) {
  board = new Array(cardArray.length);

  for (var column = 0; column < maxColumn; column++) {
    for (var row = 0; row < maxRow; row++) {
      var indexVal = index(column, row);
      if (indexVal >= cardArray.length) {
        break;
      }
      board[indexVal] = null;
      var card = cardArray[indexVal];
      createBlock(column, row, card.img, indexVal, card.imgId, background);
    }
  }
}

function calculateBoadSizes(backgroundWidth, backgroundHeight) {
  var candidateLeftScreenPadding = backgroundWidth / columnGridSize;
  var candidateTopScreenPadding = backgroundHeight / rowGridSize;
  var candidateBlockWidth = Math.floor(candidateLeftScreenPadding * ((columnGridSize - 2) / tilesPerRow));
  var candidateBlockHeight = Math.floor(candidateTopScreenPadding * ((rowGridSize - 2) / tilesPerColumn));
  var minimumTileSide = Math.min(candidateBlockWidth, candidateBlockHeight);

  blockWidth = minimumTileSide;
  blockHeight = minimumTileSide;
  leftAndRightScreenPadding = (backgroundWidth - (minimumTileSide * tilesPerRow)) / 2;
  topAndBottomScreenPadding = (backgroundHeight - (minimumTileSide * tilesPerColumn)) / 2;

  maxColumn = Math.floor(
    (backgroundWidth - leftAndRightScreenPadding * 2) / blockWidth
  );
  maxRow = Math.floor(
    (backgroundHeight - topAndBottomScreenPadding * 2) / blockHeight
  );
  maxIndex = maxRow * maxColumn;
}

function cleanBoard() {
  for (var i = 0; i < maxIndex; i++) {
    if (board[i] != null) board[i].destroy();
  }
}

function redrawBlock(column, row, indexVal) {
  var card = board[indexVal];
  if (!card) {
      return false;
  }
  card.x = column * blockWidth + leftAndRightScreenPadding;
  card.y = row * blockHeight + topAndBottomScreenPadding;
  card.width = blockWidth;
  card.height = blockHeight;
  return true;
}

function createBlock(column, row, imagePath, indexVal, imgId, background) {
  if (component == null) component = Qt.createComponent("MemoryBlock.qml");

  var dynamicObject = component.createObject(background);
  if (dynamicObject == null) {
    console.log("error creating block");
    console.log(component.errorString());
    return false;
  }
  dynamicObject.x = column * blockWidth + leftAndRightScreenPadding;
  dynamicObject.y = row * blockHeight + topAndBottomScreenPadding;
  dynamicObject.width = blockWidth;
  dynamicObject.height = blockHeight;
  dynamicObject.activeImage = imagePath;
  dynamicObject.newIndex = indexVal;
  dynamicObject.imgId = imgId;
  board[indexVal] = dynamicObject;

  return true;
}
