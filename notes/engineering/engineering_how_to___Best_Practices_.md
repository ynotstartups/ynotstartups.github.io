# Best Practices

## Behavioral - Personal growth

- There is No Such Thing as Over Communication!
- Look for opportunity for incremental improvement
- Read documentation/manual/user’s guide before using a new tool/cli
    - this implies prefer using tool with good doc e.g. `fish` instead `bash`
- Be more curious about how things work internally
- Be prepared because I am bad at ac-hoc talk and thinking
    - ask for agenda for meetings so that I can be prepared
- Validate assumptions earlier
- For meetings,
    - gather questions before meeting
    - set out the purpose of the meetings
    - write meeting minutes and action points


## Documentations - Building structures with natural language

- Write non-code How To, repeatable steps for public or personal, e.g.
    - How-To deploy UAT
    - How-To add a graphql endpoint 
- Write code comments, documentations before implementation 
    - remember the 4 types of documentation, Tutorial, How-To Step by Step Guides,
      Explanation, Reference
- Present tense and full sentence

## Design - Writing good code

- Design it twice
    - write down two designs, each with pros and cons, then perhaps there will
      appear a third design with combined pros and less cons
- Architect great design rather than just working codes, then writing comments
  should be fun since that’s how you identify the best design
- reduce complexity by adding or removing abstraction
- Design Goal: reliable, scalable, maintainable

tag: reference, django 

- `models` field
    - use `help_text` as documentation
    - use `unique=True` is this field must be unique throughout the table 

