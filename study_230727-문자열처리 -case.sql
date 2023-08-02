-- 코드 값을 레이블로 변경하

select
	user_id
	, case
		when register_device = 1 then '데스크톱'
		when register_device = 2 then '스마트폰'
		when register_device = 3 then '애플리케이션'
		else '기타'
	end as device_name
from mst_users;


-- case when
-- case로 시작하여 end로 끝나는 문법
-- case 다음으로는 when 조건 then 조건이 만족할 시 값
-- 또는 case 다음 else -> when 조건에 해당하지 않는 나머지의 값들로 표현