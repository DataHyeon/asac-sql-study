-- 레퍼러 도메인 추출
select stamp,
	substring(referrer from 'https?://([^/]*)') as referrer_host
from access_log;



-- url 경로와 요청 매개변수 값 추출
select stamp, url,
	substring(url from '//[^/]+([^?#]+)') as path,
	substring(url from 'id=([^&]*)') as id
from access_log;
-- * [] <- 문자 한개를 뜻하 듯
-- * [^/] <- /가 아닌 문자 아무거나
-- * [^/]+ <- /가 아닌 문자 아무거나 한 개 이상
-- * ㄱㄴ([ㅠ]) <- ()안에 들어 있는 문자만 찾음



-- 문자열을 배열로 분해하기
-- url 경로를 슬래시로 분할해서 계층을 추출
select stamp, url,
	split_part(substring(url from '//[^/]+([^?#]+)'), '/', 2) as path1,
	split_part(substring(url from '//[^/]+([^?#]+)'), '/', 3) as path2
from access_log;
-- * split_part(문자열, '분리문자', 분리된 것의 몇번째인지)



-- 날짜와 타임스탬프 다루기
select current_date as dt, current_timestamp as stamp;
-- * 다른 미들웨어의 sql경우 타임존이 없는 타임스탬프 반환
-- * postgresql에서는 localtimestamp 사용 추천
select current_date as dt, localtimestamp as stamp;
	


-- 지정한 값의 날짜/시각 데이터 추출하기
-- 문자열을 날짜/타임스탬프 변환하기
select 
	-- 방식 1
	cast('2016-01-30' as date) as dt,
	cast('2016-01-30 12:00:00' as timestamp) as stamp,
	-- 방식 2
	date '2016-01-30' as dt2,
	timestamp '2016-01-30 12:00:00' as stamp2,
	-- 방식 3
	'2016-01-30'::date as dt3,
	'2016-01-30 12:00:00'::timestamp as stamp3;









