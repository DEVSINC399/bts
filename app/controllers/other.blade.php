@inject('request', 'Illuminate\Http\Request')
@extends('layouts.app')

@section('breadcrumbs')
    <section class="content-header" style="padding: 10px 15px !important;">
        <h1>Banks</h1>
    </section>
@stop

@section('content')
    <div class="box box-primary">
        <div class="box-header">
            <i class="fa fa-list" style="padding-top: 6px;" aria-hidden="true"></i>
            <h3 class="box-title" style="padding-top: 6px;">List</h3>
            <a class="btn btn-success pull-right" href="{{ route('admin.banks.create') }}">Add New Bank</a>
        </div>
        <div class="panel-body table-responsive">
            <table class="table-stripped table table-bordered" id="users-table">
                <thead>
                    <tr>
                        <th>ID</td>
                        <th>Bank Name</th>
                        <th>Created At</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($Banks as $Bank)
                        <tr>
                            <td>{{ $Bank->id }}</td>
                            <td>{{ $Bank->name }}</td>
                            <td>{{ $Bank->created_at }}</td>
                            <td>
                                <a href="{{ route('admin.banks.edit', ['id' => $Bank->id]) }}" class='btn btn-xs btn-info'><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
                                <br>
                                @if($Bank->status)
                                    <a href="{{ route('admin.banks.inactive', ['id' => $Bank->id]) }}" class='btn btn-xs btn-warning' style='margin-top: 3px;'><i class="fa fa-times" aria-hidden="true"></i> Deactivate</a>
                                @else
                                    <a href="{{ route('admin.banks.active', ['id' => $Bank->id]) }}" class='btn btn-xs btn-warning' style='margin-top: 3px;'><i class="fa fa-check" aria-hidden="true"></i> Activate</a>
                                @endif
                                
                                <form action="{{ route('admin.banks.destroy', ['id' => $Bank->id]) }}" method="post">
                                    {{ method_field('DELETE') }}
                                    {{ csrf_field() }}
                                    <button class='btn btn-danger btn-xs' style='margin-top: 3px;' onclick='confirm("Are you sure you want to perform this action ?"'><i class="fa fa-trash" aria-hidden="true"></i> Delete</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@stop

@section('js')
    <script type="javascript/text" src="{{ asset('js\admin\banks\list.js') }}"></script>
    <script>
        var FormControls = function(){
            $('#users-table').DataTable();

        }();

        $(document).ready(function(){
            
        });
    </script>
@stop