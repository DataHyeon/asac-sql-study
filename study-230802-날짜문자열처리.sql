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
	'2016-01-30 12:00:00'::timestamp as stamp3



-- 날짜/시각에서 특정 필드 추출
select stamp,
	extract(year from stamp) as year,
	extract(month from stamp) as month,
	extract(day from stamp) as day,
	extract(hour from stamp) as hour,
	extract(minute from stamp) as minute,
	extract(second from stamp) as second
from	
	(select cast('2023-08-02 12:00:00' as timestamp) as stamp) as t

	
	
--substring 을 사용한 문자열에서 날짜 추출
-- substring(문자열, 시작위치, 몇번재까지) + substr()함수도 동
select stamp,
	substring(stamp, 1, 4) as year,
	substring(stamp, 6, 2) as month,
	substring(stamp, 9, 2) as day,
	substring(stamp, 12, 2) as hour,
	substring(stamp, 15, 2) as minute,
	substring(stamp, 18, 2) as second,
	substr(stamp, 1, 4) as year2,
	substr(stamp, 6, 2) as month2,
	substr(stamp, 9, 2) as day2,
	substr(stamp, 12, 2) as hour2,
	substr(stamp, 15, 2) as minute2,
	substr(stamp, 18, 2) as second2
from	
	(select cast('2023-08-02 12:00:00' as text) as stamp) as t