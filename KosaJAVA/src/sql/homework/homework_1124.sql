-- 1. ANSI-JOIN을 사용해서 사원번호, 이름, 부서번호, 위치를 출력하는데 상사가 149인 사원들만 출력하시오.
select EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.LAST_NAME, EMPLOYEES.DEPARTMENT_ID, departments.LOCATION_ID
from EMPLOYEES
         inner join DEPARTMENTS
                    on EMPLOYEES.DEPARTMENT_ID = departments.DEPARTMENT_ID
where employees.MANAGER_ID = 149;
-- 2. 직무에 4번째에서 6번째까지 PRO가 있다면 it_program으로 출력
--                                  ACC가 있다면 finance_account
--                                  나머지는 business로 출력하시오.
select case substr(JOB_ID, 4, 2)
           when 'PRO' then 'it_program'
           when 'ACC' then 'finance_account'
           else 'business' end job_id
from EMPLOYEES;

select *
from DEPARTMENTS;

-- 3. 직무에 REP가 포함되어 있는 사원들의 평균 급여와 최소급여
--       최대급여 급여의 합계를 구하시오.
select sum(SALARY) + min(SALARY) + max(SALARY)
from EMPLOYEES
where JOB_ID like '%REP%';

-- 5.  부서별 최대 급여가 10000이상인 부서만 출력하시오.
select distinct DEPARTMENT_ID, max(SALARY)
from EMPLOYEES
where SALARY >= 10000
group by DEPARTMENT_ID;

-- 6. 직무에 'SA'포함하고 있지 않은 사원들중 직무별 급여의 합계가
-- 10000을 초과하는 직무와 급여의 합계를 출력하시오.
-- 또한 급여의 합계를 내림차순으로 정렬하여 출력
select sum(SALARY), JOB_ID
from EMPLOYEES
where JOB_ID not like '%SA%'
group by JOB_ID
having sum(SALARY) > 10000
order by sum(salary);

-- 7. 부서가 20이거나 50인 부서의 사원번호와 부서번호 및 부서명
-- 그리고 위치정보를 출력하시오.
select EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.DEPARTMENT_ID, departments.DEPARTMENT_NAME, DEPARTMENTS.LOCATION_ID
from EMPLOYEES,
     DEPARTMENTS
where departments.DEPARTMENT_ID in (20, 50);

-- 8. Matos라는 성을 가지고 있는 사원이 있다.
-- 이 사원의 부서정보와 사원번호 그리고 성을 출력하시오.
select DEPARTMENT_ID, EMPLOYEE_ID, LAST_NAME
from EMPLOYEES
where LAST_NAME like 'Matos';

-- 9. Matos라는 성을 가지고 있는 사원과 King라는 성을
--       가진 사원이 있다.
-- 이 사원의 부서정보와 사원번호 그리고 성을 출력하시오.
select DEPARTMENT_ID, EMPLOYEE_ID, LAST_NAME
from EMPLOYEES
where LAST_NAME in ('Matos', 'King');

-- 10. King라는 성을 가지고 있는 사원이 있다.
-- 이 사원의 부서정보와 사원번호 그리고 성을 출력하시오.
-- ANSI-JOIN을 사용할 것
select E.DEPARTMENT_ID,EMPLOYEE_ID,FIRST_NAME
from DEPARTMENTS
         join EMPLOYEES E on DEPARTMENTS.DEPARTMENT_ID = E.DEPARTMENT_ID
where LAST_NAME like 'King';

-- 12. 부서테이블에서 부서번호와 부서명 그리고 지역코드와
--       지역명을 출력하는데 지역코드가 1400인 지역만 출력
-- T-SQL, ANSI JOIN


-- 14. 직원의 정보를 출력할 때 부서정보와 그 부서의 주소를
--       출력하시오.
-- 15. 직원정보를 출력할 때 그 직원의 부서정보와 그 직원
--       직무내용을 출력하시오.
--       부서번호, 부서명, 직무번호, 직무내용
-- 16. 사원정보와 부서정보를 출력할 때 사원이 없는 부서도 출력하되
-- 200번 부서부터 260부서를 제외하고 출력하시오.
--
-- 17. 사원정보와 부서정보를 출력할 때 사원이 없는 부서도 출력하되
-- 사원번호가 홀수인 것 만 출력하시오.
--
-- 18. 직원의 직원정보와 직무내역을 출력하는 직무내역이 없는
-- 직원도 출력하시오. job_history도 이용
--
-- 19. 직무에 4번째에서 6번째까지 PRO가 있다면 it_program으로 출력
--                                  ACC가 있다면 finance_account
--                                  나머지는 business로 출력하시오.
-- 20. 급여가 15000 이상이면 임원으로 출력
--              10000 이상이면 부장
--              7000  이상이면 과장
--              5000이상이면 대리
--              나머지는 사원으로 출력하시오.
--
-- 21. 부서별 급여의 평균이 5000이상인 부서만 출력하시오.
--
-- 22. 급여가 10000이상인 사원들중 부서별 급여 평균이 16000이상인 부서만 출력하시오
--
-- 23. 입사일이 2005년도  이전에 입사한 사람들 중 부서별 최대급여가 8000이상인 부서와 최대 급여를 출력하시오.
--
-- 24. 부서별 최대 급여가 10000이상인 부서만 출력하시오.
--
-- 25. 직무에 'REP'포함하고 있지 않은 사원들중 직무별 급여의 합계가 3000을 초과하는 직무와 급여의 합계를 출력하시오.
-- 또한 급여의 합계를 내림차순으로 정렬하여 출력
--
-- 26.  직원의 25-10-2020까지의 근무일수를 계산하시오.
-- 직원번호, 부서번호, 입사일, 근무일수
--
-- 27. '01-01-2005'에 입사한 사원을 출력하시오.
-- 직원번호, 부서번호, 입사일, 근무일수
--
-- 28. 연봉(급여*12) : 급여는 커미션까지 포함된다.
-- 직원의 년봉을 구하시오.
--  직원번호, 부서번호, 급여, 년봉
--
-- 29.  'IT_PROG' 이면 급여를  1.10*salary
--       'ST_CLERK' 이면 급여를  1.15*salary
--       'SA_REP' 이면  급여를 1.20*salary
--        나머지 직무는 salary 로 급여를 지불하고 heading name을      "REVISED_SALARY"가 되게 하시오.
-- case와 decode를 모두 사용하시오.
--
-- 30 커미션을 포함한 급여의 평균을 구하시오. 커미션을 바다지 않은 직원도 포함
--
-- 31. 각부서별 커미션을 포함한 급여의 합계를 구하시오.
--
-- 32. 각 부서의 직원수가 5명 이상인 부서만 출력하시오. (join아님)
--
-- 33. 각 부서에 있는 사원의 직무별 급여의 평균을 구하시오.
--
-- 34. 사원번호, 이름 , 급여, 입사일 , 부서번호, 부서명, 직무번호, 직무명을 출력할 때 담당하지 않는 직무도 출력하고 사원이 없는 직무도 출력하시오.
--
-- 35. 사원테이블에서 직무에 MAN를 포함하고 급여가 10000이상인
-- 사원을 사원번호와 성과 직무 그리고 급여를 출력하시오.
--
-- 36. 직무가 SA_REP와 AD_PRES 이면서 급여가 15000을 초과하는
-- 사원을 출력하시오.
-- 단, 성, 직무, 급여만 출력 or와 and만 사용
--
-- 37. 위 예제에 in연산자를 사용하시오.
--
-- 38. 부서는 내림차순으로 정렬하고 입사일도 내림차순으로 정렬
-- 부서번호 , 급여, 입사일, 성
--
-- 39. 부서는 내림차순으로 정렬하고 입사일은 오름차순으로 정렬하여 출력
-- 부서번호 , 급여, 입사일, 성
--
-- 40. 부서는 내림차순으로 정렬하고 입사일은 오름차순으로 정렬하여
-- 급여를 내림차순으로 정렬하여 출력
-- 부서번호 ,  입사일, 급여, 성