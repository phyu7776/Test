# Test
깃허브 연동에 대한 자세한 설명 https://kuzuro.blogspot.com/2018/04/github.html
# 게시물 작성
Controller 부분에서 목록 불러오는 부분은 데이터 베이스에서 GET 하여 가져왔지만 작성 부분에서는 POST 사용

먼저 게시물을 작성하여 가져오고
```java
// 게시물 작성
@RequestMapping(value = "/write", method = RequestMethod.GET)
public void getWirte() throws Exception {

}
```
작성한후에 연동되어 있는 데이터 베이스에 넣어주기위해 Mapper를 통해 쿼리문을 작성해 주는데
```
<!-- 게시물 작성 -->
<insert id="write" parameterType="com.board.domain.BoardVO">
 insert into
  tbl_board(title, content, writer)
   values(#{title}, #{content}, #{writer})
</insert>
```
실행할떄 no database select 오류가 뜨면 마지막 줄에
from database 적어줄것 !!
아니면 root-context 부분에  property name="url" value="jdbc:mariadb://127.0.0.1:3306/스키마이름" 적을것


후에 게시물을 데이터 베이스에 올림
```java
//@RequestMapping 은 주소에 있는 특정한 값을 가져옴
@RequestMapping(value = "/write", method = RequestMethod.POST)
Public String posttWirte(BoardVO vo) throws Exception {
  service.write(vo);
  
  return "redirect:/board/list";
}
```
07.02
페이지 수정 ,삭제 ,인클루드 , 페이징 기능 구현

수정기능
write 기능과 유사하게 GET -> POST 동작 방식
삭제기능
BoardControl(Get)->BoardService->BoardServicelmpl->BoardsDAO->BoardDAOimpl->BoardMapper
인클루드
jsp를 이용하여 원하는 페이지를 연결시키면됨
```java
// 예시
  <a href="/board/write">글 작성</a> 
  
  // 인클루드 페이지를 작성후 다른페이지에도 인클루드가 보일수있도록 연결
  <div id="nav">
 <%@ include file="../include/nav.jsp" %>
</div>
  
```


Mapper 에 sql 기능 관련 코드를 적는곳
자바의 인터페이스는 어떠한 객체가 있고 그객체가 특정한 인터페이스를 사용하려면 그 객체는 반드시 인터페이스의 메소들을 구현해야 한다
또한 상속과 인터페이스의 차이점은 
상속은 하나의 부모클래스밖에 못가지지만
인터페이스는 다중상속이 가능하고 
또한 인터페이스가 가지고 있는 특정한 메소드를 클래스가 반드시 가지도록 한다.
```java
interface (이름){ 
// 반드시 가져야 하는 메소드 구현
}
class A implements (이름),(이름)... { //기능 구현
}
```
overloading 는 같은 이름의 여러 메소드를 가지며 반드시 파라미터가 달라야한다.
overriding 은 상위 클래스가 가지고 있는 메서드를 하위 클래스가  재정의 해서 사용하는경우 (상속의 특징)
BoardDAO = 인터페이스
BoardDAOImpi = 인터페이스 동작 구현

```java
public class BoardDAOlmpl implements BoardDAO {
private SqlSession sql;
	private static String namespace = "com.board.mappers.board";
 
public List<BoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".list");
	} // namespace 를 따라 가면 boardMapper.java 의 <mapper namespace="com.board.mappers.board">
  // .list 는 BoardMapper의 select id 를 따라간다
  ```





