-- 결측치 처리
-- 결측치를 처리하지 않으면 집계함수 사용시 Null값 처리됨

-- 구매액에서 할인 쿠폰 값을 제외한 매출금액
-- 쿠폰 컬럼에 결측치 존재
select
	purchase_id,
	amount,
	coupon,
	amount - coupon as discount_amount1,
	amount - coalesce(coupon, 0) as discount_amount2
from purchase_log_with_coupon;

