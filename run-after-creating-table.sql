/* 다른 테이블이 생성된 이후에 Run */

/* SNS로부터 접속하는 정보 */
create table UserConnection (userId varchar(255) not null,
    providerId varchar(255) not null,
    providerUserId varchar(255),
    rank int not null,
    displayName varchar(255),
    profileUrl varchar(512),
    imageUrl varchar(512),
    accessToken varchar(255) not null,					
    secret varchar(255),
    refreshToken varchar(255),
    expireTime bigint,
    primary key (userId));
create unique index UserConnectionRank on UserConnection(userId);

/* 권한 설정 */
insert into auth (authority, name, version) values ("ROLE_USER", "회원", 0);
insert into auth (authority, name, version) values ("ROLE_ADMIN", "관리자", 0);

/* 기본 홀 생성 */
insert into hall (name, create_date, version) values ("기본 홀", now(), 0);