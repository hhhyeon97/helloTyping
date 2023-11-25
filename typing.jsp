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
        <button class="btn btn-secondary" id="startbtn" onclick="startTyping()">시작</button>
        <p id="sentence">타자 연습을 시작하세요!</p>
        <input type="text" id="userInput" placeholder="여기에 입력하세요" disabled>
        <button class="btn btn-secondary" id="okbtn" onclick="checkTyping()">확인</button>
        <p id="result"></p>
        <p id="timer">남은 시간: <span id="time">60</span>초</p>
    </div>

<script>    

const sentences = [
	'다른 사람들을 평가한다면 그들을 사랑할 시간이 없다.',
	'시간은 환상이다. 점심시간은 두 배로 그렇다.',
	'오늘 할 수 있는 일을 내일로 미루지 마라.',
	'니가 뭘 좋아할지 몰라서 새우버거로 주문해놨다',
	'한때 나는 편지에 모든 생을 담았다.',
	'사랑은 규칙을 알지 못한다.',
	'어디로 가는 개미를 본 적 있어',
	'단단한 땅에 물이 괸다.',
	'다람쥐 쳇바퀴 돌듯.',
	'콩 심은 데 콩 나고 팥 심은 데 팥 난다.',
	'실제의 세상은 상상의 세상보다 훨씬 작다.',
	'공포를 느껴라, 그리고 그래도 도전하라.',
	'덜 약속하고 더 해주어라',
	'지붕은 햇빛이 밝을 때 수리해야 합니다.',
];

/* 추후 새로운 문장 추가할 때 ! 방법이 여러가지
sentences.push('새로운 문장 추가하기');
 */
 
 
let currentSentenceIndex = 0;
let timer;


let correctCount = 0;
let incorrectCount = 0;
let remainingSentences = []; // 남은 구문을 저장하는 배열 추가


function getRandomSentence() {
	  if (remainingSentences.length === 0) {
	        endTyping(); // 모든 구문이 나왔다면 종료
	        return;
	    }
    const randomIndex = Math.floor(Math.random() * sentences.length);
    
 // 중복 방지를 위해 사용된 구문을 배열에서 제거
    remainingSentences.splice(randomIndex, 1);

    return sentences[randomIndex];
    //return randomSentence;
}




function startTyping() {
	  // 초기화
    correctCount = 0;
    incorrectCount = 0;
    
    // 남은 구문 초기화 방법 1 
    //remainingSentences = [...sentences];
    
    // 남은 구문 초기화 방법 2 
    //slice 메서드는 배열의 복사본을 만들어 반환한다. 
    remainingSentences = sentences.slice();
    
	// 엔터 키 이벤트 리스너 추가
	document.getElementById('userInput').addEventListener('keyup', function(event) {
	    if (event.key === 'Enter') {
	        checkTyping();
	    }
	});
	
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
        document.getElementById('userInput').value = '';
        document.getElementById('sentence').textContent = getRandomSentence();
        correctCount++;
    } else {
        resultElement.textContent = '틀렸습니다!';
        document.getElementById('userInput').value = '';
        document.getElementById('sentence').textContent = getRandomSentence();
        incorrectCount++;
    }
}

function endTyping() {
    clearInterval(timer);
    const startButton = document.querySelector('button');
    startButton.disabled = false;

    const userInput = document.getElementById('userInput');
    userInput.disabled = true;

    alert(`타자 연습이 종료되었습니다!\n맞춘 개수: ${correctCount}\n틀린 개수: ${incorrectCount}`);
}
</script>
</body>
</html>