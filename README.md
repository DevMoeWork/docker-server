# 도커에서 서버 배포 쉽게 하려고 만든 도커 써-버
## 처음 설치하면 이걸 해야해요
- 그냥 싹 다 가져다가 붙여요
- mariadb와 php의 경우 한 서버에 많은 도커 파일이 들어가면 자원낭비가 심각하므로, 언젠가 다른 버전관리 저장소를 파서 관리할거에요.
    - ex) 여러 아파치 서버가 돌아가는데 mariadb/php가 여러개 돌아가는 구조.<br>
    너무 비효율적입니다.<br>
    사실 root 계정이 관리하면 다 해결되긴 하는데...;;<br>
    itk가 안돌아가더라고요 도커 컨테이너 내부에서...
```bash
# 기본 디렉토리 생성
mkdir ./sources/
mkdir ./sources/mariadb/
mkdir ./sources/web/
mkdir ./sources/default/
mkdir ./settings/
mkdir ./settings/apache/
mkdir ./settings/apache/conf-enabled/
mkdir ./settings/php/
mkdir ./settings/vhosts/

# 파일 복사
cp ./samples/.env ./.env
cp ./samples/docker-compose.yml ./docker-compose.yml

# 아파치쪽 작업
cp ./samples/apache/apache2.conf ./settings/apache/apache2.conf
cp ./samples/apache/ports.conf ./settings/apache/ports.conf
cp ./samples/apache/security.conf ./settings/apache/conf-enabled/security.conf
cp ./samples/apache/000-default.conf ./settings/vhosts/000-default.conf
cp ./samples/apache/index.html ./sources/default/index.html

# PHP 작업
cp ./samples/php/php.ini ./settings/php/php.ini
```

## 폴더 설명
1. configure - Docker 빌드업 소스 경로
2. settings - 각종 환경설정파일 경로(아파치, PHP, 기타...)
    1. apache - 아파치 설정파일 경로
    2. php - php 설정파일 경로
    3. vhosts - 아파치 가상호스트 설정파일 경로
3. sources - 작업하면 되는 폴더
    1. mariadb - mariadb 데이터베이스가 저장되는 공간
    2. web - 웹 파일이 저장되는 공간
    3. default - 기본 경로 (도메인 연결 안 되었을때 표시 될 곳)