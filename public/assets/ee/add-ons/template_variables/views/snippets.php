<table class="snippetsTable" cellspacing="0" cellpadding="0">
	<thead>
		<tr>
			<th><?= lang( 'snippet_syntax' )?></th>
			<th><?= lang( 'edit' )?></th>
		</tr>
	</thead>
	<tbody>
	<?php
	$i = 0;
	foreach ( $snippets as $result )
	{
		$i++;
		?>
		<tr>
			<td><a class="copy" id="s<?=$i?>" href="#"><span class="copyText">{<?=$result[ 'snippet_name' ]?>}</span><span class="clipTip"><span class="arrow"></span><span class="clipText"></span></span></a></td>
			<td><a href="<?=$result[ 'snippet_link' ]?>"><?= lang( 'edit' )?></a></td>
		</tr>
		<?php
	}
	?>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2"><a href="<?=BASE . AMP . 'C=design' . AMP . 'M=snippets_edit'?>"><?= lang( 'create_new_snippet' )?></a></td>
		</tr>
	</tfoot>
</table>