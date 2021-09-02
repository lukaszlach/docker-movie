# Docker Movie

![Version](https://img.shields.io/badge/version-0.1-lightgrey.svg?style=flat)

**Docker Movie** allows to convert a movie file to a Docker image.

```bash
docker run -it lukaszlach/because:reasons
```

![](https://user-images.githubusercontent.com/5011490/131734808-0918cae4-57ba-4c0c-95dd-73bcc04c2fc4.png)

## Usage

```bash
git clone https://github.com/lukaszlach/docker-movie.git
cd docker-movie/
```

```bash
# Render text frames
make frames MOVIE=movie.avi
make frames MOVIE=movie.mp4

# Render 1/10 frames-per-second (fps)
make frames MOVIE=movie.mpg FPS=1/10
# Render 2fps, that would result in quite big image size
make frames MOVIE=movie.mpg FPS=2

# Build Docker image
make build

# Play the movie
make run

# Fast-forward
make run SEEK=500
# Control the playback speed
make run SLEEP=0.4
# Drop a single frame from the movie
make run SEEK=100 ONCE=1
```

```bash
# Play
make run
^C
SEEK=2773

# Resume
make run SEEK=2773
```

![](https://user-images.githubusercontent.com/5011490/131734818-81422d44-1d0b-4b88-b93c-6da3660f59da.png)

![](https://user-images.githubusercontent.com/5011490/131760996-dcc015a6-d2e1-49e4-b7ff-89ebd47c83d8.png)

## License

MIT License

Copyright (c) 2021 Łukasz Lach <llach@llach.pl>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
