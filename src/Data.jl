type _datalist_add{T}
    this::T
end

function (_this::_datalist_add)(xs...)
    push!(_this.this.value, xs...)
    _this.this
end

type _datalist_append{T}
    this::T
end

function (_this::_datalist_append)(x)
    append!(_this.this.value, x)
    _this.this
end

type _datalist_set{T}
    this::T
end

function (_this::_datalist_set)(x)
    _this.this.value = x
    _this.this
end

type _datalist_get{T}
    this::T
end

function (_this::_datalist_get)(x)
    _this.this.value
end

type DataList
    value::Vector

    add::_datalist_add{DataList}
    push::_datalist_add{DataList}
    push!::_datalist_add{DataList}

    append::_datalist_append{DataList}
    append!::_datalist_append{DataList}

    set::_datalist_set{DataList}
    set!::_datalist_set{DataList}

    get::_datalist_get{DataList}

    DataList(x=[]) = begin
        this = new(x)

        this.add = _datalist_add{DataList}(this)
        this.push = this.add
        this.push! = this.add

        this.append = _datalist_append{DataList}(this)
        this.append! = this.append

        this.set = _datalist_set{DataList}(this)
        this.set! = this.set

        this.get = _datalist_get{DataList}(this)

        this
    end
end


type _dataitem_set{T}
    this::T
end

function (_this::_dataitem_set)(x)
    _this.this.value = x
    _this.this
end

type _dataitem_get{T}
    this::T
end

function (_this::_dataitem_get)(x)
    _this.this.value
end

type DataItem
    value::Any

    DataItem() = begin
        this = new()

        this.set = _dataitem_set{DataItem}(this)
        this.set! = this.set

        this.get = _dataitem_get{DataItem}(this)

        this
    end
end

type DataSet
    x::DataList
    y::DataList
    z::DataList
    g::DataList
    s::DataList

    DataSet() = DataSet(DataList(), DataList(), DataList(), DataList(), DataList())
end
