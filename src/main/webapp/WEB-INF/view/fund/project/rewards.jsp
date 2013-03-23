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
				{
					cls: 'perfectum'
				},
				$DIV(
					{
						cls: 'box span12'
					},
					$DIV(
						{
							cls: 'box-header',
							dataOriginalTitle: ''
						},
						$H2(
							$I(
								{
									cls: 'icon-edit'
								}
							),
							$SPAN(
								{
									cls: 'break'
								},
								'보상 입력'
							)
						)
					),
					$DIV(
						{
							cls: 'box-content'
						},
						$FORM(
							{
								cls: 'form-horizontal'
							},
							$INPUT(
								{
									type : 'hidden',
									name : 'projectId',
									value : '${command.id}'
								}
							),
							$DIV(
								{
									cls: 'control-group'
								},
								$LABEL(
									{
										cls: 'control-label',
										forward: 'pledgeAmount'
									},
									'목표 기금액'
								),
								$DIV(
									{
										cls: 'controls'
									},
									$DIV(
										{
											cls: 'input-append'
										},
										$INPUT(
											{
												style : {
													textAlign: 'right'
												},
												type : 'text',
												name : 'pledgeAmount'
											}
										),
										$SPAN(
											{
												cls: 'add-on'
											},
											'원'
										)
									)
								)
							),
							$DIV(
								{
									cls: 'control-group'
								},
								$LABEL(
									{
										cls: 'control-label',
										forward: 'description'
									},
									'보상 설명'
								),
								$DIV(
									{
										cls: 'controls'
									},
									$TEXTAREA(
										{
											type : 'text',
											cls : 'input-xxlarge',
											name : 'description',
											rows : '6'
										}
									)
								)
							),
							$DIV(
								{
									cls: 'control-group'
								},
								$LABEL(
									{
										cls: 'control-label',
										forward: 'maxInvestorCount'
									},
									'최대 후원자 수'
								),
								$DIV(
									{
										cls: 'controls'
									},
									$DIV(
										{
											cls: 'input-append'
										},
										$INPUT(
											{
												style : {
													textAlign: 'right'
												},
												type : 'text',
												name : 'maxInvestorCount'
											}
										),
										$SPAN(
											{
												cls: 'add-on'
											},
											'명'
										)
									)
								)
							)
						)
					)
				)
			));
		}
		
		function complete() {
			$("#overlay").show();
			
			var count = $('form').size(), i = 0;
			
			if (count === 0) {
				location.href = '<c:url value="/fund/project/${command.id}/open" />';
			}
			
			$('form').each(function() {
				$form = $(this);
				$form.one('submit', function() {
					
					value = form2js(this);
					
					if (value.description === undefined) {
						$("#overlay").hide();
						$DIV({cls:'help-inline'}, '설명을 입력해주세요.').insertAfter($form.find('textarea[name="description"]'));
					} else {
					
						POST('<c:url value="/fund/reward/create.json" />', value, function(command) {
							if (command.id === undefined || command.id === null) {
								$("#overlay").hide();
								$form.prepend('오류가 있습니다.');
							} else {
								i++;
							}
	
							if (count === i) {
								location.href = '<c:url value="/fund/project/${command.id}/open" />';
							}
							
						});
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
					<button class="btn btn-large" style="margin-right:10px;" onclick="createRewardForm();">
						<i class="icon-plus"></i>
						보상 추가
					</button>
					<button class="btn btn-large btn-primary" onclick="complete();">보상 입력 완료</button>
				</p>
			</div>
		</div>

	</body>
</html>
