/**
 *  스크립트 버전 1 
 */
const sentences = [
	'계란으로 바위치기',
	'헤맨 만큼 내 땅이다.',
	'나락도 락이다.',
	'내 코가 석자',
	'아침의 미소가 저녁까지',
	'나 3월에 4학년이니까 내 말 잘 들어라!',
	'빛 좋은 개살구',
	'누구에게나 바다가 있다.',
	'다른 사람들을 평가한다면 그들을 사랑할 시간이 없다.',
	'오늘 할 수 있는 일을 내일로 미루지 마라.',
	'네가 뭘 좋아할지 몰라서 새우버거로 주문해놨다.',
	'한때 나는 편지에 모든 생을 담았다.',
	'사랑은 규칙을 알지 못한다.',
	'어디로 가는 개미를 본 적 있어',
	'단단한 땅에 물이 괸다.',
	'다람쥐 쳇바퀴 돌 듯.',
	'콩 심은 데 콩 나고 팥 심은 데 팥 난다.',
	'실제의 세상은 상상의 세상보다 훨씬 작다.',
	'공포를 느껴라, 그리고 그래도 도전하라.',
	'덜 약속하고 더 해주어라',
	'지붕은 햇빛이 밝을 때 수리해야 합니다.',
	'건강은 제일의 재산이다.',
	'세상에 공짜는 없다.',
	'행동의 가치는 그 행동을 끝까지 이루는 데 있다.',
	'일단 시작해라. 나중에 완벽해지면 된다.',
	'내 마음에 비친 내 모습',
	'사람들 사이에 섬이 있다.',
	'이 우주 안 작은 파도',
	'희망은 어둠을 밝히는 등불이다.',
	'한 시간 독서로 누그러지지 않은 걱정은 결코 없다.',
	'이른 아침은 입에 황금을 물고 있다.',
	'행복은 습관이다'
];



/*테스트용*/
/* const sentences = [
	'안녕','하이','방가'
]; */

/* 추후 새로운 문장 추가할 때 ! 방법이 여러가지
sentences.push('새로운 문장 추가하기');
 */
 
 
let currentSentenceIndex = 0;
//let timer;


var correctCount = 0;
var incorrectCount = 0;
let remainingSentences = []; // 남은 구문을 저장하는 배열 추가


//getRandomSentence 함수에서 문장을 선택하고 제거하는 부분을 수정
function getRandomSentence() {
  if (remainingSentences.length === 0) {
    endTyping(); // 모든 구문이 나왔다면 종료
    return;
  }
  const randomIndex = Math.floor(Math.random() * remainingSentences.length);
  const randomSentence = remainingSentences[randomIndex];

  // 중복 방지를 위해 사용된 구문을 배열에서 제거
  remainingSentences.splice(randomIndex, 1);

  return randomSentence;
}
     
     
//1129 수정 
 let timer;

function startTyping(time) {
	
	//music.play();
	
    // 초기화
    correctCount = 0;
    incorrectCount = 0;

    remainingSentences = sentences.slice();

    document.getElementById('userInput').addEventListener('keyup', function(event) {
      if (event.key === 'Enter') {
        checkTyping();
      }
    });

 	const btn60 = document.getElementById('60secBtn');
    const btn30 = document.getElementById('30secBtn');

    btn60.style.display = 'none';
    btn30.style.display = 'none';
    
	okBtn.disabled = false; // 시작하면 확인 버튼 활성화


    const userInput = document.getElementById('userInput');
    userInput.disabled = false;
    userInput.value = '';
    userInput.focus();

	document.getElementById('result').textContent = '';

    // 타이머 보이기
    const timerElement = document.getElementById('timer');
    timerElement.style.display = 'block';
    
    document.getElementById('result').textContent = '';
    document.getElementById('time').textContent = time; // 선택된 시간으로 갱신

    const sentenceElement = document.getElementById('sentence');
    sentenceElement.textContent = getRandomSentence();

    timer = setInterval(updateTimer, 1000);
  }



       
//타이머 업데이트 
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

//타자 검사 기능
function checkTyping() {
    const userInput = document.getElementById('userInput').value;
    const currentSentence = document.getElementById('sentence').textContent;
    const resultElement = document.getElementById('result');

  var resultContainer = document.getElementById('resultContainer');
        
 if (userInput === currentSentence) {
 
  		resultContainer.innerHTML = '<p style="color: green;">정답입니다!</p>';
      document.querySelector('.container').style.borderColor = 'green'; // 테두리 초록색
      
        document.getElementById('userInput').value = '';
        document.getElementById('sentence').textContent = getRandomSentence();
     
        correctCount++;
        console.log('맞춘 개수:', correctCount);


        
        // 맞췄을 때 배경에 무언가 표시
        //document.body.style.background = 'url("popup.png") center/cover no-repeat fixed';

        // 1초 후에 배경을 원래대로 복구
        setTimeout(() => {
            document.body.style.background = '';
        }, 1000);
    } else {
    
     	resultContainer.innerHTML = '<p style="color: red;">오답입니다!</p>';
      document.querySelector('.container').style.borderColor = 'red'; // 테두리 빨간색
  
        document.getElementById('userInput').value = '';
        document.getElementById('sentence').textContent = getRandomSentence();
        incorrectCount++;
        console.log('틀린 개수:', incorrectCount);
 
    }
    
    
    /*
    if (userInput === currentSentence) {
        //resultElement.textContent = '정답입니다!';
        document.getElementById('userInput').value = '';
        document.getElementById('sentence').textContent = getRandomSentence();
        correctCount++;
        console.log('맞춘 개수:', correctCount);
    } else {
        //resultElement.textContent = '틀렸습니다!';
        document.getElementById('userInput').value = '';
        document.getElementById('sentence').textContent = getRandomSentence();
        incorrectCount++;
        console.log('틀린 개수:', incorrectCount);
    }
   */ 
   
}


 function endTyping() {
    clearInterval(timer);
    
    const userInput = document.getElementById('userInput');
    userInput.disabled = true;

    const btn60 = document.getElementById('60secBtn');
    const btn30 = document.getElementById('30secBtn');

    btn60.style.display = 'inline-block';
    btn30.style.display = 'inline-block';
    
    // 확인 버튼 비활성화
    okBtn.disabled = true;
    
    // 결과 알림창 확인 후 화면 초기화
    setTimeout(function () {
    
    var totalAttempts = correctCount + incorrectCount; // 전체 시도한 문제 수 계산
	var accuracy = (correctCount / totalAttempts) * 100; // 정답률 계산
      
      // 알림창에 맞춘 개수와 틀린 개수 표시
      alert('타자 연습이 종료되었습니다!\n맞춘 개수 : ' + correctCount + '\n틀린 개수 : ' + incorrectCount
      +'\n총 시도한 문제 수: ' + totalAttempts + '\n정답률: ' + accuracy.toFixed(2) + '%');
      // 결과 알림창 확인 후 화면 초기화									// 소수점둘째자리까지
      resetScreen();
      // 페이지를 다시 로드하여 변수 초기화
        location.reload();
    }, 0);
  }
  
  
// 결과 확인 후 초기화 하기 
  function resetScreen() {
    correctCount = 0;
    incorrectCount = 0;
    
    const userInput = document.getElementById('userInput');
    userInput.value = '';

    const sentenceElement = document.getElementById('sentence');
    sentenceElement.textContent = '타자 연습을 시작하세요!';

    const resultElement = document.getElementById('result');
    resultElement.textContent = '';

    const timeElement = document.getElementById('time');
    timeElement.textContent = '60';

    const btn60 = document.getElementById('60secBtn');
    const btn30 = document.getElementById('30secBtn');

    btn60.style.display = 'inline-block';
    btn30.style.display = 'inline-block';
    
      // 확인 버튼 비활성화
    okBtn.disabled = true;
  }
  