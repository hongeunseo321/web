<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Daum-style Portal Template</title>
  <style>
    :root{--accent:#ff7a00;--muted:#666;--bg:#f5f6f8;--card:#fff}
    *{box-sizing:border-box}
    body{font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Noto Sans KR', 'Nanum Gothic', sans-serif; margin:0; background:var(--bg); color:#222}
    header{background:linear-gradient(90deg,#fff 0,#f9f9f9);border-bottom:1px solid #e6e6e6}
    .container{max-width:1100px;margin:0 auto;padding:18px}
    .topbar{display:flex;align-items:center;gap:16px}
    .logo{font-weight:800;color:var(--accent);font-size:22px}
    .search{flex:1;display:flex}
    .search input{flex:1;padding:10px 14px;border:1px solid #ddd;border-radius:24px 0 0 24px;outline:none}
    .search button{background:var(--accent);color:#fff;border:none;padding:0 18px;border-radius:0 24px 24px 0;cursor:pointer}
    .quick-links{display:flex;gap:12px;font-size:13px;color:var(--muted)}

    main{padding:20px 0}
    .grid{display:grid;grid-template-columns:2fr 1fr;gap:18px}

    /* Left column */
    .cards{display:grid;gap:12px}
    .card{background:var(--card);padding:14px;border-radius:8px;box-shadow:0 1px 0 rgba(0,0,0,0.03)}
    .news-list{display:grid;gap:10px}
    .news-item{display:flex;gap:12px;align-items:center}
    .news-thumb{width:96px;height:64px;background:#eee;border-radius:6px;flex-shrink:0}
    .news-meta{font-size:13px;color:var(--muted)}

    /* Right column */
    .side-widgets{display:grid;gap:12px}
    .widget-title{font-weight:700;margin-bottom:8px}
    .weather{display:flex;align-items:center;gap:12px}
    .weather .icon{width:64px;height:64px;background:#fff;border-radius:10px;display:flex;align-items:center;justify-content:center;font-size:28px}

    /* footer */
    footer{padding:18px 0;color:var(--muted);font-size:13px}

    /* responsive */
    @media(max-width:900px){.grid{grid-template-columns:1fr}.logo{font-size:18px}.search input{padding:10px}.news-thumb{width:76px;height:56px}}
  </style>
</head>
<body>
  <header>
    <div class="container topbar">
      <div class="logo">DAUM</div>
      <div class="search">
        <input id="q" placeholder="검색어를 입력하세요" />
        <button id="searchBtn">검색</button>
      </div>
      <nav class="quick-links">
        <div>메일</div>
        <div>카페</div>
        <div>뉴스</div>
        <div>지도</div>
      </nav>
    </div>
  </header>

  <main>
    <div class="container grid">
      <section>
        <div class="cards">
          <div class="card">
            <h3>헤드라인 뉴스</h3>
            <div id="headline" style="margin-top:10px;display:flex;gap:12px;align-items:flex-start">
              <div style="flex:1">
                <h2 id="headline-title" style="margin:0 0 6px 0;font-size:18px">샘플 헤드라인 뉴스 제목입니다</h2>
                <p id="headline-summary" style="margin:0;color:var(--muted)">요약 텍스트: 이 영역은 메인 헤드라인 기사 요약이 들어가는 곳입니다.</p>
              </div>
              <div style="width:180px;height:110px;background:#eee;border-radius:8px"></div>
            </div>
          </div>

          <div class="card">
            <h3>많이 본 뉴스</h3>
            <div class="news-list" id="newsList" style="margin-top:10px">
              <!-- JS로 채워짐 -->
            </div>
          </div>

          <div class="card">
            <h3>콘텐츠 섹션 (예: 실시간 검색어/연예/스포츠)</h3>
            <div style="margin-top:10px;color:var(--muted)">원하시는 항목을 넣어 커스터마이징 하세요.</div>
          </div>
        </div>
      </section>

      <aside>
        <div class="side-widgets">
          <div class="card">
            <div class="widget-title">날씨</div>
            <div class="weather">
              <div class="icon">☀️</div>
              <div>
                <div style="font-weight:700">서울 20℃</div>
                <div style="color:var(--muted);font-size:13px">맑음 · 체감 19℃</div>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="widget-title">지도</div>
            <div style="height:200px;background:#fafafa;border:1px dashed #eee;border-radius:8px;display:flex;align-items:center;justify-content:center;color:var(--muted)">
              Daum (Kakao) Map API 삽입 위치
            </div>
            <small style="color:var(--muted);display:block;margin-top:8px">※ 실제 지도를 넣으려면 Kakao Developers에서 REST/API 키를 발급받아 스크립트를 추가하세요.</small>
          </div>

          <div class="card">
            <div class="widget-title">주요 서비스</div>
            <ul style="padding-left:16px;margin:0;color:var(--muted)">
              <li>메일</li>
              <li>카페</li>
              <li>블로그</li>
            </ul>
          </div>
        </div>
      </aside>
    </div>
  </main>

  <footer>
    <div class="container">
      © sample portal template · customize freely
    </div>
  </footer>

  <script>
    // 샘플 데이터 (템플릿을 열면 자동으로 채워집니다)
    const sampleNews = [
      {title:'정부, 새 경제 정책 발표', summary:'오늘 발표된 경제 정책의 주요 내용과 기대 효과를 정리합니다.'},
      {title:'기술기업, AI 투자 확대', summary:'국내 주요 기업들이 AI 분야에 대규모 투자를 발표했습니다.'},
      {title:'프로야구, 시즌 순위 확정', summary:'막판 역전극으로 순위가 뒤바뀌었습니다.'},
      {title:'영화 신작 개봉', summary:'국내외 기대작들의 개봉 소식과 관객 반응.'}
    ];

    const newsListEl = document.getElementById('newsList');
    sampleNews.forEach((n,i)=>{
      const item = document.createElement('div');
      item.className = 'news-item';
      item.innerHTML = `
        <div class="news-thumb"></div>
        <div>
          <div style="font-weight:600">${n.title}</div>
          <div class="news-meta">${n.summary}</div>
        </div>
      `;
      newsListEl.appendChild(item);
    });

    // 검색 버튼 예시
    document.getElementById('searchBtn').addEventListener('click', ()=>{
      const q = document.getElementById('q').value.trim();
      if(!q){alert('검색어를 입력하세요');return}
      alert('검색: '+q+' (실제 검색 연동은 백엔드 또는 API를 연결하세요)');
    });

    // 헤드라인 샘플 변경 (랜덤)
    const hl = sampleNews[0];
    document.getElementById('headline-title').textContent = hl.title;
    document.getElementById('headline-summary').textContent = hl.summary;

    // NOTE: Daum/Kakao Map 사용 예시
    // 1) https://developers.kakao.com 에서 JavaScript key 발급
    // 2) <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_JS_KEY"></script> 추가
    // 3) 지도 생성 코드를 위의 '지도' div에 넣으면 됩니다.
  </script>
</body>
</html>
