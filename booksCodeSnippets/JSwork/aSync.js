function textFile(filename) {
  return new Promise((resolve, reject) => {
    readTextFile(filename, (text, error) => {
      if (error) reject(error);
      else resolve(text);
    });
  });
}

function withTimeout(promise, time) {
  return new Promise((resolve, reject) => {
    promise.then(resolve, reject);
    setTimeout(() => reject("Timed out"), time);
  });
}

function crackPasscode(networkID) {
  function nextDigit(code, digit) {
    let newCode = code + digit;
    return withTimeout(joinWifi(networkID, newCode), 50)
      .then(() => newCode)
      .catch(failure => {
        if (failure == "Timed out") {
          return nextDigit(newCode, 0);
        } else if (digit < 9) {
          return nextDigit(code, digit + 1);
        } else {
          throw failure;
        }
      });
  }
  return nextDigit("", 0);
}

var Group = class Group {
  constructor() { this.members = []; }
  add(m) { this.members.add(m); }
}

var screenAddresses = [
  "10.0.0.44", "10.0.0.45", "10.0.0.41",
  "10.0.0.31", "10.0.0.40", "10.0.0.42",
  "10.0.0.48", "10.0.0.47", "10.0.0.46"
];

function displayFrame(frame) {
  return Promise.all(frame.map((data, i) => {
    return request(screenAddresses[i], {
      command: "display",
      data
    });
  }));
}

function wait(time) {
  return new Promise(accept => setTimeout(accept, time));
}

var VideoPlayer = class VideoPlayer {
  constructor(frames, frameTime) {
    this.frames = frames;
    this.frameTime = frameTime;
    this.stopped = true;
  }

  async play() {
    this.stopped = false;
    for (let i = 0; !this.stopped; i++) {
      let nextFrame = wait(this.frameTime);
      await displayFrame(this.frames[i % this.frames.length]);
      await nextFrame;
    }
  }

  stop() {
    this.stopped = true;
  }
}

async function fileSizes(files) {
  let list = "";
  await Promise.all(files.map(async fileName => {
    list += fileName + ": " +
      (await textFile(fileName)).length + "\n";
  }));
  return list;
}


//+-+-+-+-+-+-+-+
Group.prototype[Symbol.iterator]=function*(){
    for(let i=0;i<this.length;++i){
        yield this.members[i];
    }
}


let video = new VideoPlayer(clipImagesm, 100);
video.play().catch(e=>{
    console.log("playback failed: " + e);
  }
);
setTimeout(() => video.stop(), 15000);


function activityTable(day){
  table=[];
  for(let i=0;i<24;++i)
    table[i]=0;

  return textFile("camera_logs.txt").then(files=>{
    return Promise.all(files.split("\n").map(name=>{
      return textFile(name).then(log=>{
        for(let t of log.split("\n")){
          let date=new Date(Number(t));
          if(date.getDay()==day)
            table[date.getHours()]++;
        }
      });
    }));
  }).then(()=>table);
}
activityTable(6)
  .then(table => console.log(activityGraph(table)));