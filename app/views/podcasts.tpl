<div class="container position-relative z-index-3 h-100">
	<div class="row align-items-center justify-content-center h-100 landing">
		<div class="box-content personal">
            <h4 class="color-primary font-weight-semibold text-7 text-center mb-3">Your podcasts</h4>
            <div class="podcastHolderProfile">
                <div class="row">
                    <table class="table table-hover text-light">
                        <thead>
							<tr>
								<th>Title</th>
								<th>Category</th>
								<th><i class="fas fa-heart"></i></th>
								<th><i class="fas fa-eye"></i></th>
                                <th><i class="fas fa-comment"></i></th>
                                <th>Edit</th>
                                <th>Delete</th>
							</tr>
						</thead>
                        <tbody>
                    {foreach $podcasts as $podcast}
                            <tr>
                                <td>
                                    <a href="{$conf->action_url}podcastView&id={$podcast["id"]}" class="text-light podcastLink">{$podcast["title"]}</a>
                                </td>
								<td>
                                    {$podcast["cat_name"]}
                                </td>
								<td>
                                    {$podcast["likes"]}
                                </td>
								<td>
                                    {$podcast["views"]}
                                </td>
								<td>
                                    {$podcast["comments"]}
                                </td>
                                <td>
                                    <a href="{$conf->action_url}editView&id={$podcast["id"]}">
                                    <button class="btn btn-secondary"><i class="icon-pencil icons"></i></button>
                                    </a>
                                </td>
                                <td>
                                    <a href="{$conf->action_url}delete&id={$podcast["id"]}"><button class="btn btn-primary"><i class="icon-trash icons"></i></button></a>
                                </td>
                                
                            </tr>
                    {foreachelse}
                    <tr>
                    <td colspan="7">No podcasts yet!</td>
                    </tr>
                    {/foreach}
                        </tbody>
                        </table>
                </div>
                </div>
        </div>
        
        </div>
        </div>
        
        </div>