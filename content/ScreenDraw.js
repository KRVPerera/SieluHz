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
    dynamicObject.x = column * blockWidth + leftAndRightScreenPadding;
    dynamicObject.y = row * blockHeight + topAndBottomScreenPadding;
    dynamicObject.width = blockWidth;
    dynamicObject.height = blockHeight;
    dynamicObject.activeImage = imagePath;
    dynamicObject.newIndex = dataId;
    dynamicObject.imgId = imgId;
    board[index(column, row)] = dynamicObject;
  } else {
    console.log("error loading block component");
    console.log(component.errorString());
    return false;
  }
  return true;
}
