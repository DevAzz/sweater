<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter!}" placeholder="Search by tag">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" action="/main" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="text" placeholder="Add message" class="form-control"/>
                </div>
                <div class="form-group">
                    <input type="text" name="tag" placeholder="Tag" class="form-control">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" class="custom-file-input" id="validatedCustomFile" required>
                        <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
            </form>
        </div>
    </div>
    <script type="text/javascript">
        document.querySelector('.custom-file-input').addEventListener('change',function(e){
            var fileName = document.getElementById("validatedCustomFile").files[0].name;
            var nextSibling = e.target.nextElementSibling;
            nextSibling.innerText = fileName
        })
    </script>
    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>
</@c.page>