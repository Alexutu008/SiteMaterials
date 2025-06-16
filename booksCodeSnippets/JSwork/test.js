const ps = require("prompt-sync");
const prompt = ps();

n = Number(prompt());
for (let i = 1; i <= n; ++i) {
  let line = "";
  for (let j = i; j <= i + n - 1; ++j)
    if (j % 2 == 0)
      line += "#";
    else
      line += " ";
  console.log(line);
}