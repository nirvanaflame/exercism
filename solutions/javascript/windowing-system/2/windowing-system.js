export class Size {
  constructor(width = 80, height = 60) {
    this.width = width;
    this.height = height;
  }

  resize(newWidth, newHeight) {
    this.width = newWidth;
    this.height = newHeight;
  }
}

export class Position {
  constructor(x = 0, y = 0) {
    this.x = x;
    this.y = y;
  }

  move(newX, newY) {
    this.x = newX;
    this.y = newY;
  }
}

export class ProgramWindow {
  constructor() {
    this.screenSize = new Size(800, 600)
    this.size = new Size(),
    this.position = new Position()
  }

  resize(newSize) {
    const maxWidth = this.screenSize.width - this.position.x
    const maxHeight = this.screenSize.height - this.position.y
    
    const newWidth = Math.max(1, Math.min(newSize.width, maxWidth))
    const newHeight = Math.max(1, Math.min(newSize.height, maxHeight))
    
    this.size.resize(newWidth, newHeight)
  }

  move({x, y}) {
    this.position.x = Math.min(
      Math.max(x, 0),
      this.screenSize.width - this.size.width
    )
    this.position.y = Math.min(
      Math.max(y, 0),
      this.screenSize.height - this.size.height
    )
  }
}

export function changeWindow(window) {
  window.resize(new Size(400, 300))
  window.move(new Position(100, 150))
  return window
}

const size = new Size(500, 400);
const position = new Position(25, 15);
const programWindow = new ProgramWindow(size, position);
programWindow.resize(size);


console.log(programWindow)

