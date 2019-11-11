---
id: overview
title: Project Overview
sidebar_label: Overview
---

> n.b use these as a framework for structuring docs - https://reactjs.org/docs/getting-started.html

## Resources

- [Generating these Docusaurus docs](https://docusaurus.io)
- Offline docs for dependent libraries <a href="file:///Users/matt/dev/docs/">(copy link)</a>
- [DevDocs](https://devdocs.io/)

## Glossary

| Term            | Meaning                                                                                                                                                                                                                                                                                                                                                     |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Queue           | The set of JSON tables in db that feed entities will be added to. Entities at this stage are said to be in "CommonEntity" format<br/>[More detail](feed-importing.md#Overview)                                                                                                                                                                              |
| Crunch          | The Crunch is the recurrent DB process that will take from the Queue. <br/>[More detail](feed-importing.md#Overview)                                                                                                                                                                                                                                        |
| Entity          | Semantic data types. Will include `Event`, `Market`etc etc                                                                                                                                                                                                                                                                                                  |
| RawEntity       | Unstructured, feed-specific format for each entity type. Essentially just the raw feed chopped into semantic entities                                                                                                                                                                                                                                       |
| CommonEntity    | The structured, validatable format for each entity type. The output of the importing process and what will go onto the queue                                                                                                                                                                                                                                |
| ProcessedEntity | Processed entities, ready for publication and consumption externally                                                                                                                                                                                                                                                                                        |
| Mergeable       | Represents an abstract definition of an Entity in DB. Does not have any connotations with who supplied the data. Mergeable as in they are completely semantically unique                                                                                                                                                                                    |
| Concrete        | Represents an instance of a Mergeable being applicable in a given context. Concrete instances will be linked to show associations - e.g. between a horse (outcome) and a winner (market). <br/><br/> Concrete instances can also have their own bespoke fields, aside from the association fields. For instance, we will need to record the home/away teams |
| Meta            | These are the entities/tables that hold metadata about the provinence of the record                                                                                                                                                                                                                                                                         |
| Mesa            | Opposite of Meta - i.e. the records to which the meta record pertains                                                                                                                                                                                                                                                                                       |
