<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타자 연습하자!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="container">
        <h3 id="typing_t">한글 타자 연습</h3>
        <button class="btn btn-secondary" onclick="startTyping()">시작</button>
        <p id="sentence">타자 연습을 시작하세요!</p>
        <input type="text" id="userInput" placeholder="여기에 입력하세요" disabled>
        <button class="btn btn-secondary" onclick="checkTyping()">확인</button>
        <p id="result"></p>
        <p id="timer">남은 시간: <span id="time">60</span>초</p>
    </div>

<script>    
/* const sentences = [
    '안녕하세요! 타자 연습을 시작해봅시다.',
    '한글 타자 연습 사이트 만들기',
    '키보드를 놓치지 마세요!',
    '자신의 속도를 높여보세요.',
    '열심히 연습하면 더 빨라질 거에요!'
]; */

const sentences = [
	'한때 나는 편지에 모든 생을 담았다.',
	'사랑은 규칙을 알지 못한다.',
	'어디로 가는 개미를 본 적 있어',
	'단단한 땅에 물이 괸다.',
	'다람쥐 쳇바퀴 돌듯.',
	'콩 심은 데 콩 나고 팥 심은 데 팥 난다.',
	'실제의 세상은 상상의 세상보다 훨씬 작다.',
	'공포를 느껴라, 그리고 그래도 도전하라.',
	'덜 약속하고 더 해주어라',
	
];

/* 추후 새로운 문장 추가할 때 ! 방법이 여러가지
sentences.push('새로운 문장 추가하기');
 */
 
 
let currentSentenceIndex = 0;
let timer;

function getNextSentence() {
    return sentences[currentSentenceIndex++ % sentences.length];
}

function getRandomSentence() {
    const randomIndex = Math.floor(Math.random() * sentences.length);
    return sentences[randomIndex];
}



function startTyping() {
    const startButton = document.querySelector('button');
    startButton.disabled = true;

    const userInput = document.getElementById('userInput');
    userInput.disabled = false;
    userInput.value = '';
    userInput.focus();

    document.getElementById('result').textContent = '';
    document.getElementById('time').textContent = '60';

    const sentenceElement = document.getElementById('sentence');
    sentenceElement.textContent = getRandomSentence();
    
    timer = setInterval(updateTimer, 1000);
}

function updateTimer() {
    const timeElement = document.getElementById('time');
    let time = parseInt(timeElement.textContent);

    if (time > 0) {
        time--;
        timeElement.textContent = time;
    } else {
        clearInterval(timer);
        endTyping();
    }
}


function checkTyping() {
    const userInput = document.getElementById('userInput').value;
    const currentSentence = document.getElementById('sentence').textContent;
    const resultElement = document.getElementById('result');

    if (userInput === currentSentence) {
        resultElement.textContent = '정답입니다!';
        endTyping();
    } else {
        resultElement.textContent = '틀렸습니다!';
    }
}

function endTyping() {
    clearInterval(timer);
    const startButton = document.querySelector('button');
    startButton.disabled = false;

    const userInput = document.getElementById('userInput');
    userInput.disabled = true;

    alert('타자 연습이 종료되었습니다!');
}
</script>
</body>
</html>