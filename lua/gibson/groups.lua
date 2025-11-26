---@class Highlight
---@variable.member fg string color name or "#RRGGBB"
---@variable.member foreground string same fg, color name or "#RRGGBB"
---@variable.member bg string color name or "#RRGGBB"
---@variable.member background string same bg, color name or "#RRGGBB"
---@variable.member sp string color name or "#RRGGBB"
---@variable.member special string same sg, color name or "#RRGGBB"
---@variable.member blend integer value between 0 and 100
---@variable.member bold boolean
---@variable.member standout boolean
---@variable.member underline boolean
---@variable.member undercurl boolean
---@variable.member underdouble boolean
---@variable.member underdotted boolean
---@variable.member underdashed boolean
---@variable.member strikethrough boolean
---@variable.member italic boolean
---@variable.member reverse boolean
---@variable.member nocombine boolean
---@variable.member link string name of another highlight group to link to, see |:hi-link|.
---@variable.member default string Don't override existing definition |:hi-default|
---@variable.member ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@variable.member ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@variable.member cterm table cterm attribute map, like |highlight-args|.

---@alias HighlightGroups table<string, Highlight>

---setup highlight groups
---@param configs GibsonConfig
---@return HighlightGroups
---@nodiscard
local function setup(configs)
    local colors = configs.colors
    assert(colors ~= nil, "Must pass colors")

    return {
        Normal = { fg = colors.fg, bg = colors.bg, },
        NormalFloat = { fg = colors.fg, bg = colors.bg, },
        Comment = { fg = colors.comment, italic = configs.italic_comment, },
        Constant = { fg = colors.yellow, },
        String = { fg = colors.yellow, },
        Character = { fg = colors.green, },
        Number = { fg = colors.bright_red, },
        Boolean = { fg = colors.cyan, },
        Float = { fg = colors.bright_red, },
        FloatBorder = { fg = colors.white, },
        Operator = { fg = colors.blue, },
        Keyword = { fg = colors.cyan, },
        Keywords = { fg = colors.cyan, },
        Identifier = { fg = colors.cyan, },
        Function = { fg = colors.yellow, },
        Statement = { fg = colors.blue, },
        Conditional = { fg = colors.magenta, },
        Repeat = { fg = colors.magenta, },
        Label = { fg = colors.cyan, },
        Exception = { fg = colors.blue, },
        PreProc = { fg = colors.yellow, },
        Include = { fg = colors.blue, },
        Define = { fg = colors.blue, },
        Title = { fg = colors.cyan, },
        Macro = { fg = colors.blue, },
        PreCondit = { fg = colors.cyan, },
        Type = { fg = colors.cyan, },
        StorageClass = { fg = colors.magenta, },
        Structure = { fg = colors.yellow, },
        TypeDef = { fg = colors.yellow, },
        Special = { fg = colors.green, italic = true },
        SpecialComment = { fg = colors.comment, italic = true, },
        Error = { fg = colors.bright_red, },
        Todo = { fg = colors.blue, bold = true, italic = true, },
        Underlined = { fg = colors.cyan, underline = true, },

        Cursor = { reverse = true, },
        CursorLineNr = { fg = colors.fg, bold = true, },

        SignColumn = { bg = colors.bg, },

        Conceal = { fg = colors.comment, },
        CursorColumn = { bg = colors.black, },
        CursorLine = { bg = colors.bright_black, },
        ColorColumn = { bg = colors.bright_black, },

        StatusLine = { fg = colors.white, bg = colors.bright_black, },
        StatusLineNC = { fg = colors.comment, },
        StatusLineTerm = { fg = colors.white, bg = colors.black, },
        StatusLineTermNC = { fg = colors.comment, },

        Directory = { fg = colors.cyan, },
        DiffAdd = { fg = colors.bg, bg = colors.green, },
        DiffChange = { fg = colors.bright_red, },
        DiffDelete = { fg = colors.red, },
        DiffText = { fg = colors.comment, },

        ErrorMsg = { fg = colors.bright_red, },
        VertSplit = { fg = colors.black, },
        WinSeparator = { fg = colors.black, },
        Folded = { fg = colors.comment, },
        FoldColumn = {},
        Search = { fg = colors.black, bg = colors.bright_red, },
        IncSearch = { fg = colors.bright_red, bg = colors.comment, },
        LineNr = { fg = colors.comment, },
        MatchParen = { fg = colors.fg, underline = true, },
        NonText = { fg = colors.nontext, },
        Pmenu = { fg = colors.white, bg = colors.menu, },
        PmenuSel = { fg = colors.white, bg = colors.bright_black, },
        PmenuSbar = { bg = colors.bg, },
        PmenuThumb = { bg = colors.bright_black, },

        Question = { fg = colors.blue, },
        QuickFixLine = { fg = colors.black, bg = colors.yellow, },
        SpecialKey = { fg = colors.nontext, },

        SpellBad = { fg = colors.bright_red, underline = true, },
        SpellCap = { fg = colors.yellow, },
        SpellLocal = { fg = colors.yellow, },
        SpellRare = { fg = colors.yellow, },

        TabLine = { fg = colors.comment, },
        TabLineSel = { fg = colors.white, },
        TabLineFill = { bg = colors.bg, },
        Terminal = { fg = colors.white, bg = colors.black, },
        Visual = { bg = colors.bright_black, },
        VisualNOS = { fg = colors.bright_black, },
        WarningMsg = { fg = colors.yellow, },
        WildMenu = { fg = colors.black, bg = colors.white, },

        EndOfBuffer = { fg = colors.bright_black },

        -- TreeSitter
        ['@error'] = { fg = colors.bright_red, },
        ['@punctuation.delimiter'] = { fg = colors.fg, },
        ['@punctuation.bracket'] = { fg = colors.fg, },
        ['@markup.list'] = { fg = colors.cyan, },

        ['@constant'] = { fg = colors.blue, },
        ['@constant.builtin'] = { fg = colors.blue, },
        ['@markup.link.label.symbol'] = { fg = colors.blue, },

        ['@constant.macro'] = { fg = colors.cyan, },
        ['@string.regexp'] = { fg = colors.red, },
        ['@string'] = { fg = colors.yellow, },
        ['@string.escape'] = { fg = colors.cyan, },
        ['@string.special.symbol'] = { fg = colors.blue, },
        ['@character'] = { fg = colors.green, },
        ['@number'] = { fg = colors.blue, },
        ['@boolean'] = { fg = colors.blue, },
        ['@number.float'] = { fg = colors.green, },
        ['@annotation'] = { fg = colors.yellow, },
        ['@attribute'] = { fg = colors.cyan, },
        ['@module'] = { fg = colors.bright_red, },

        ['@function.builtin'] = { fg = colors.cyan, },
        ['@function'] = { fg = colors.green, },
        ['@function.macro'] = { fg = colors.green, },
        ['@variable.parameter'] = { fg = colors.bright_red, },
        ['@variable.parameter.reference'] = { fg = colors.bright_red, },
        ['@function.method'] = { fg = colors.green, },
        ['@variable.member'] = { fg = colors.bright_red, },
        ['@property'] = { fg = colors.blue, },
        ['@constructor'] = { fg = colors.cyan, },

        ['@keyword.conditional'] = { fg = colors.magenta, },
        ['@keyword.repeat'] = { fg = colors.magenta, },
        ['@label'] = { fg = colors.cyan, },

        ['@keyword'] = { fg = colors.magenta, },
        ['@keyword.function'] = { fg = colors.cyan, },
        ['@keyword.function.ruby'] = { fg = colors.magenta, },
        ['@keyword.operator'] = { fg = colors.magenta, },
        ['@operator'] = { fg = colors.magenta, },
        ['@keyword.exception'] = { fg = colors.blue, },
        ['@type'] = { fg = colors.bright_cyan, },
        ['@type.builtin'] = { fg = colors.cyan, italic = true, },
        ['@type.qualifier'] = { fg = colors.magenta, },
        ['@structure'] = { fg = colors.blue, },
        ['@keyword.include'] = { fg = colors.magenta, },

        ['@variable'] = { fg = colors.fg, },
        ['@variable.builtin'] = { fg = colors.blue, },

        ['@markup'] = { fg = colors.bright_red, },
        ['@markup.strong'] = { fg = colors.bright_red, bold = true, },
        ['@markup.emphasis'] = { fg = colors.yellow, italic = true, },
        ['@markup.underline'] = { fg = colors.bright_red, },
        ['@markup.heading'] = { fg = colors.magenta, bold = true, },
        ['@markup.raw'] = { fg = colors.yellow, },
        ['@markup.link.url'] = { fg = colors.yellow, italic = true, },
        ['@markup.link'] = { fg = colors.bright_red, bold = true, },

        ['@tag'] = { fg = colors.cyan, },
        ['@tag.attribute'] = { fg = colors.green, },
        ['@tag.delimiter'] = { fg = colors.cyan, },

        -- Semantic
        ['@class'] = { fg = colors.cyan },
        ['@struct'] = { fg = colors.cyan },
        ['@enum'] = { fg = colors.cyan },
        ['@enumMember'] = { fg = colors.blue },
        ['@event'] = { fg = colors.cyan },
        ['@interface'] = { fg = colors.cyan },
        ['@modifier'] = { fg = colors.cyan },
        ['@regexp'] = { fg = colors.yellow },
        ['@typeParameter'] = { fg = colors.cyan },
        ['@decorator'] = { fg = colors.cyan },

        -- LSP Semantic (0.9+)
        ['@lsp.type.class'] = { fg = colors.cyan },
        ['@lsp.type.enum'] = { fg = colors.cyan },
        ['@lsp.type.decorator'] = { fg = colors.green },
        ['@lsp.type.enumMember'] = { fg = colors.blue },
        ['@lsp.type.function'] = { fg = colors.green, },
        ['@lsp.type.interface'] = { fg = colors.cyan },
        ['@lsp.type.macro'] = { fg = colors.cyan },
        ['@lsp.type.method'] = { fg = colors.green, },
        ['@lsp.type.namespace'] = { fg = colors.bright_red, },
        ['@lsp.type.parameter'] = { fg = colors.bright_red, },
        ['@lsp.type.property'] = { fg = colors.blue, },
        ['@lsp.type.struct'] = { fg = colors.cyan },
        ['@lsp.type.type'] = { fg = colors.bright_cyan, },
        ['@lsp.type.variable'] = { fg = colors.fg, },

        -- HTML
        htmlArg = { fg = colors.green, },
        htmlBold = { fg = colors.yellow, bold = true, },
        htmlEndTag = { fg = colors.cyan, },
        htmlH1 = { fg = colors.magenta, },
        htmlH2 = { fg = colors.magenta, },
        htmlH3 = { fg = colors.magenta, },
        htmlH4 = { fg = colors.magenta, },
        htmlH5 = { fg = colors.magenta, },
        htmlH6 = { fg = colors.magenta, },
        htmlItalic = { fg = colors.blue, italic = true, },
        htmlLink = { fg = colors.blue, underline = true, },
        htmlSpecialChar = { fg = colors.yellow, },
        htmlSpecialTagName = { fg = colors.cyan, },
        htmlTag = { fg = colors.cyan, },
        htmlTagN = { fg = colors.cyan, },
        htmlTagName = { fg = colors.cyan, },
        htmlTitle = { fg = colors.white, },

        -- Markdown
        markdownBlockquote = { fg = colors.yellow, italic = true, },
        markdownBold = { fg = colors.bright_red, bold = true, },
        markdownCode = { fg = colors.green, },
        markdownCodeBlock = { fg = colors.bright_red, },
        markdownCodeDelimiter = { fg = colors.red, },
        markdownH2 = { link = "rainbow2" },
        markdownH1 = { link = "rainbow1" },
        markdownH3 = { link = "rainbow3" },
        markdownH4 = { link = "rainbow4" },
        markdownH5 = { link = "rainbow5" },
        markdownH6 = { link = "rainbow6" },
        markdownHeadingDelimiter = { fg = colors.red, },
        markdownHeadingRule = { fg = colors.comment, },
        markdownId = { fg = colors.blue, },
        markdownIdDeclaration = { fg = colors.cyan, },
        markdownIdDelimiter = { fg = colors.blue, },
        markdownItalic = { fg = colors.yellow, italic = true, },
        markdownLinkDelimiter = { fg = colors.blue, },
        markdownLinkText = { fg = colors.magenta, },
        markdownListMarker = { fg = colors.cyan, },
        markdownOrderedListMarker = { fg = colors.red, },
        markdownRule = { fg = colors.comment, },
        ['@markup.heading.1.markdown'] = { link = 'rainbowcol1' },
        ['@markup.heading.2.markdown'] = { link = 'rainbowcol2' },
        ['@markup.heading.3.markdown'] = { link = 'rainbowcol3' },
        ['@markup.heading.4.markdown'] = { link = 'rainbowcol4' },
        ['@markup.heading.5.markdown'] = { link = 'rainbowcol5' },
        ['@markup.heading.6.markdown'] = { link = 'rainbowcol6' },

        --  Diff
        diffAdded = { fg = colors.green, },
        diffRemoved = { fg = colors.red, },
        diffFileId = { fg = colors.yellow, bold = true, reverse = true, },
        diffFile = { fg = colors.nontext, },
        diffNewFile = { fg = colors.green, },
        diffOldFile = { fg = colors.red, },

        debugPc = { bg = colors.menu, },
        debugBreakpoint = { fg = colors.red, reverse = true, },

        -- Git Signs
        GitSignsAdd = { fg = colors.bright_green, },
        GitSignsChange = { fg = colors.cyan, },
        GitSignsDelete = { fg = colors.bright_red, },
        GitSignsAddLn = { fg = colors.black, bg = colors.bright_green, },
        GitSignsChangeLn = { fg = colors.black, bg = colors.cyan, },
        GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red, },
        GitSignsCurrentLineBlame = { fg = colors.white, },

        -- Telescope
        TelescopePromptBorder = { fg = colors.comment, },
        TelescopeResultsBorder = { fg = colors.comment, },
        TelescopePreviewBorder = { fg = colors.comment, },
        TelescopeSelection = { fg = colors.white, bg = colors.bright_black, },
        TelescopeMultiSelection = { fg = colors.blue, bg = colors.bright_black, },
        TelescopeNormal = { fg = colors.fg, bg = colors.bg, },
        TelescopeMatching = { fg = colors.green, },
        TelescopePromptPrefix = { fg = colors.blue, },
        TelescopeResultsDiffDelete = { fg = colors.red },
        TelescopeResultsDiffChange = { fg = colors.cyan },
        TelescopeResultsDiffAdd = { fg = colors.green },

        -- Bufferline
        BufferLineIndicatorSelected = { fg = colors.blue, },
        BufferLineFill = { bg = colors.black, },
        BufferLineBufferSelected = { bg = colors.bg, },
        BufferLineSeparator = { fg = colors.black },

        -- LSP
        DiagnosticError = { fg = colors.red, },
        DiagnosticWarn = { fg = colors.yellow, },
        DiagnosticInfo = { fg = colors.cyan, },
        DiagnosticHint = { fg = colors.cyan, },
        DiagnosticUnderlineError = { undercurl = true, sp = colors.red, },
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow, },
        DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan, },
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan, },
        DiagnosticSignError = { fg = colors.red, },
        DiagnosticSignWarn = { fg = colors.yellow, },
        DiagnosticSignInfo = { fg = colors.cyan, },
        DiagnosticSignHint = { fg = colors.cyan, },
        DiagnosticFloatingError = { fg = colors.red, },
        DiagnosticFloatingWarn = { fg = colors.yellow, },
        DiagnosticFloatingInfo = { fg = colors.cyan, },
        DiagnosticFloatingHint = { fg = colors.cyan, },
        DiagnosticVirtualTextError = { fg = colors.red, },
        DiagnosticVirtualTextWarn = { fg = colors.yellow, },
        DiagnosticVirtualTextInfo = { fg = colors.cyan, },
        DiagnosticVirtualTextHint = { fg = colors.cyan, },

        LspDiagnosticsDefaultError = { fg = colors.red, },
        LspDiagnosticsDefaultWarning = { fg = colors.yellow, },
        LspDiagnosticsDefaultInformation = { fg = colors.cyan, },
        LspDiagnosticsDefaultHint = { fg = colors.cyan, },
        LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true, },
        LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true, },
        LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true, },
        LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true, },
        LspReferenceText = { fg = colors.bright_red, },
        LspReferenceRead = { fg = colors.bright_red, },
        LspReferenceWrite = { fg = colors.bright_red, },
        LspCodeLens = { fg = colors.cyan, },
        LspInlayHint = { fg = "#969696", bg = "#2f3146" },

        -- IndentBlankLine
        IndentBlanklineContextChar = { fg = colors.bright_red, nocombine = true, },

        -- Cmp
        CmpItemAbbr = { fg = colors.white, bg = colors.bg },
        CmpItemKind = { fg = colors.white, bg = colors.bg },
        CmpItemKindMethod = { link = "@function.method" },
        CmpItemKindText = { link = "@markup" },
        CmpItemKindFunction = { link = "@function" },
        CmpItemKindConstructor = { link = "@type" },
        CmpItemKindVariable = { link = "@variable" },
        CmpItemKindClass = { link = "@type" },
        CmpItemKindInterface = { link = "@type" },
        CmpItemKindModule = { link = "@module" },
        CmpItemKindProperty = { link = "@property" },
        CmpItemKindOperator = { link = "@operator" },
        CmpItemKindReference = { link = "@variable.parameter.reference" },
        CmpItemKindUnit = { link = "@variable.member" },
        CmpItemKindValue = { link = "@variable.member" },
        CmpItemKindField = { link = "@variable.member" },
        CmpItemKindEnum = { link = "@variable.member" },
        CmpItemKindKeyword = { link = "@keyword" },
        CmpItemKindSnippet = { link = "@markup" },
        CmpItemKindColor = { link = "DevIconCss" },
        CmpItemKindFile = { link = "TSURI" },
        CmpItemKindFolder = { link = "TSURI" },
        CmpItemKindEvent = { link = "@constant" },
        CmpItemKindEnumMember = { link = "@variable.member" },
        CmpItemKindConstant = { link = "@constant" },
        CmpItemKindStruct = { link = "@structure" },
        CmpItemKindTypeParameter = { link = "@variable.parameter" },

        -- TS rainbow colors
        rainbowcol1 = { fg = colors.fg },
        rainbowcol2 = { fg = colors.magenta },
        rainbowcol3 = { fg = colors.cyan },
        rainbowcol4 = { fg = colors.green },
        rainbowcol5 = { fg = colors.blue },
        rainbowcol6 = { fg = colors.bright_red },
        rainbowcol7 = { fg = colors.fg },

        -- Rainbow delimiter
        RainbowDelimiterRed = { fg = colors.fg },
        RainbowDelimiterYellow = {fg = colors.magenta },
        RainbowDelimiterBlue = {fg = colors.cyan },
        RainbowDelimiterOrange = { fg = colors.green },
        RainbowDelimiterGreen = { fg = colors.blue },
        RainbowDelimiterViolet = { fg = colors.bright_red },
        RainbowDelimiterCyan = { fg = colors.fg },

        -- dap UI
        DapUIPlayPause = { fg = colors.bright_green },
        DapUIRestart = { fg = colors.green },
        DapUIStop = { fg = colors.red },
        DapUIStepOver = { fg = colors.cyan },
        DapUIStepInto = { fg = colors.cyan },
        DapUIStepOut = { fg = colors.cyan },
        DapUIStepBack = { fg = colors.cyan },
        DapUIType = { fg = colors.bright_blue },
        DapUIScope = { fg = colors.bright_cyan },
        DapUIModifiedValue = { fg = colors.bright_cyan, bold = true },
        DapUIDecoration = { fg = colors.bright_cyan },
        DapUIThread = { fg = colors.bright_green },
        DapUIStoppedThread = { fg = colors.bright_cyan },
        DapUISource = { fg = colors.bright_blue },
        DapUILineNumber = { fg = colors.bright_cyan },
        DapUIFloatBorder = { fg = colors.bright_cyan },
        DapUIWatchesEmpty = { fg = colors.magenta },
        DapUIWatchesValue = { fg = colors.bright_green },
        DapUIWatchesError = { fg = colors.magenta },
        DapUIBreakpointsPath = { fg = colors.bright_cyan },
        DapUIBreakpointsInfo = { fg = colors.bright_green },
        DapUIBreakpointsCurrentLine = { fg = colors.bright_green, bold = true },
        DapStoppedLine = { default = true, link = 'Visual' },
        DapUIWinSelect = { fg = colors.bright_cyan, bold = true },
    }
end

return {
    setup = setup,
}
