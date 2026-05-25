function Header(el)
  if FORMAT:match("typst") and el.level == 1 then
    local title = pandoc.utils.stringify(el.content)
    local stripped = title:gsub("^Chapter%s+%d+:%s*", "")

    if stripped ~= title then
      el.content = pandoc.Inlines(stripped)
    end
  elseif FORMAT:match("typst") and el.level > 1 then
    local title = pandoc.utils.stringify(el.content)
    local stripped = title:gsub("^%d+%.%s+", "")

    if stripped ~= title then
      el.content = pandoc.Inlines(stripped)
    end
  end

  return el
end
