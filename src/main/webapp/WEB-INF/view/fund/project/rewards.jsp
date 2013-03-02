<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<title>프로젝트 보상 입력</title>
		
		<script>
		function createRewardForm() {
			$('#rewards').append($DIV(
				$FORM({
					style: {
						border: '1px solid #333',
						padding: 10,
						marginBottom: 10
					}
				},
					$P(
						$INPUT({
							type : 'hidden',
							name : 'projectId',
							value : '${command.id}'
						})
					),
					$P(
						$LABEL('목표 기금액'),
						$IMG({src:'<c:url value="/img/energy.png" />'}),
						$INPUT({
							name : 'pledgeAmount'
						})
					),
					$P(
						$LABEL('보상 설명'),
						$INPUT({
							name : 'description'
						})
					),
					$P(
						$LABEL('최대 후원자 수'),
						$INPUT({
							name : 'maxInvestorCount'
						})
					)
				)
			));
		}
		
		function complete() {
			var count = $('form').size(), i = 0;
			$('form').each(function() {
				$form = $(this);
				$form.one('submit', function() {
					
					value = form2js(this);
					
					if (value.description === undefined) {
						$form.find('input[name="description"]').after('설명을 입력해주세요.');
					} else {
					
						$.post('<c:url value="/fund/reward/create.json" />', value, function(data) {
							if (data.command.id === undefined || data.command.id === null) {
								$form.prepend('오류가 있습니다.');
							} else {
								i++;
							}
	
							if (count === i) {
								location.href = '<c:url value="/fund/project/${command.id}/open" />';
							}
							
						}, 'json');
					}
						
					return false;
				});
				$(this).submit();
			});
		}
		</script>
		
	</head>

	<body>
	
		<div id="page-title">
		
			<h2>프로젝트 보상 입력</h2>
		
		</div>
	
		<div id="wrapper">
			<div id="content">
				<div id="rewards">
				</div>
				<p>
					<a href="javascript:createRewardForm();">보상 추가</a>
				</p>
				<p>
					<a href="javascript:complete();">보상 입력 완료</a>
				</p>
			</div>
		</div>

	</body>
</html>
