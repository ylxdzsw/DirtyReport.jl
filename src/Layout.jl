abstract Layout

type Row <: Layout
    chidren::Vector{Layout}
end

type Col <: Layout
    chidren::Vector{Layout}
end

type Element <: Layout
    template::Symbol
    dataset::Int
end

abstract Token

type OpenRow <: Token end
type CloseRow <: Token end
type SplitCol <: Token end
type EofToken <: Token end
type StrToken <: Token
    value::String
end
type NumToken <: Token
    value::Int
end

type _tokenizer_next{T}
    this::T
end

type Tokenizer
    code::String
    i::Int

    next::_tokenizer_next{Tokenizer}
    Tokenizer(code) = begin
        this = new(code, 1)
        this.next = _tokenizer_next{typeof(this)}(this)
        this
    end
end

function (_this::_tokenizer_next)()
    code = _this.this.code

    while _this.this.i <= length(code)
        i = _this.this.i
        _this.this.i += 1
        if 'a' <= code[i] <= 'z'
            while _this.this.i <= length(code) && 'a' <= code[_this.this.i] <= 'z'
                _this.this.i += 1
            end
            return StrToken(code[i:_this.this.i-1])
        elseif '1' <= code[i] <= '9'
            return NumToken(Int(code[i]) - Int('0'))
        elseif code[i] == '['
            return OpenRow()
        elseif code[i] == ']'
            return CloseRow()
        elseif code[i] == '|'
            return SplitCol()
        end # ignore any other characters, including whitespaces, uppercase letters etc.
    end

    EofToken()
end

function parse_layout(tokens::Tokenizer)

end
