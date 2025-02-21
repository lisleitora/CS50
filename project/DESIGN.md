# Design Document

By Lis Andrade Cardoso

Video overview: <URL HERE>

## Scope

In this section you should answer the following questions:

* What is the purpose of your database?

The purpose of this database is to facilitate the storage, retrieval, and organization of (more commonly known as 'fanfiction') unpublished independent creative writing works, that are sometimes based of famous media, like movies, games or books.
It allows users to explore various works, search for specific content, and engage with authors and their creations.


* Which people, places, things, etc. are you including in the scope of your database?Any user who logs into the platform.

Works created by users, including stories, poems, and other written content;
Metadata about works, such as titles, descriptions, genres, and tags;
Authors and their profiles;
User interactions with works, including bookmarks, collections, and comments.


* Which people, places, things, etc. are *outside* the scope of your database?

External literary content not uploaded by users.
Non-text-based content such as images, videos, or audio files.
Personal user data beyond what is necessary for authentication and profile creation.
Administrative or moderation tools beyond what is necessary for standard user interactions.

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?

Search for a type of work or a specific work,
 find certain authors and browse their works,
  bookmark works for easy access later,
  create and manage collections of works (which are groups of works the users can create and manage)
  and design/apply new tags to categorize works.


* What's beyond the scope of what a user should be able to do with your database?

Users cannot modify or delete another user's work nor directly alter system metadata or database records.

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?

Users (As the name implies, this is where the users data is.);
Works (This entity organizes the data of the works (fanfiction or independent writing).);
Fandoms (The fandoms entity classifies base the work on published/'official' works it is based of.);
Comments (The comments users can post about works.);
Bookmarks (When a work is bookmarked by an user, it is linked to them so the user can find the work later.);
Collections (Collections are just like a spotify playlist; Users and authors can group some works as they please.).


* What attributes will those entities have?
#### Users

The `users` table includes:
* `id`, which uniquely identifies a user. It is the primary key and an integer that automatically increments.
* `email`, which stores the user's email address, given that `TEXT` can still store long-form text.
* `username`, which stores the user's username, given that `TEXT` can still store long-form text.
* `password`, which stores the user's password, given that `TEXT` can still store long-form text.

#### Works

The `works` table includes:
* `id`, which uniquely identifies a work. It is the primary key and an integer that automatically increments.
* `author_id`, which represents the username and ID of the author/creator of the work. It is an integer and a foreign key referencing the `users` table.
* `work_name`, which represents the work's title, given that `TEXT` can still store long-form text.
* `content`, which represents the work's content, given that `TEXT` can still store long-form text.
* `rating`, which represents the adequate age for reading the work, as G means 'general', T means 'teen and up', M means 'Mature' and E means 'Explicit: only suitable for adults', given that `TEXT` can still store long-form text.
* `kudos`, which represents the equivalent of likes for this platform. It is an integer with a default value of 0.
* `is_finished`, which represents if the work is already published in entirety or if it's ongoing/incomplete, given that `TEXT` can still store long-form text.
* `relationships`, which represents the type of romance that may be there: F/F (female to female, e.g., lesbian), M/M (male to male, e.g., gay), F/M (female to male, e.g., hetero), Gen (romance is not the main topic or there is none), Multi (more than one partner or more than one type of relation), Other (other relationships), given that `TEXT` can still store long-form text.
* `warnings`, which represents warnings about what you may encounter in the work: graphic depictions of violence, major character death, rape/non-con, underage sex. The specific warnings can be written in the column, given that `TEXT` can still store long-form text.
* `fandom_id`, which represents the fandoms as a way of classifying the fanfiction. It is an integer and a foreign key referencing the `fandoms` table.
* `language`, which represents the language in which the work is written, given that `TEXT` can still store long-form text.
* `hits`, which represents how many users have reached the work. It is an integer with a default value of 0.
* `words`, which represents the number of words the work has. It is an integer.
* `chapters`, which represents how many chapters the work has. It is an integer.
* `creation_date`, which represents the date the work was first published. It is a numeric value with a default value of the current timestamp.
* `updated_at`, which represents the last time it was updated. It is a numeric value with a default value of the current timestamp.

#### Fandoms

The `fandoms` table includes:
* `id`, which uniquely identifies a fandom. It is the primary key and an integer that automatically increments.
* `name`, which represents the name of the original work on which fanfiction authors can base their stories, given that `TEXT` can still store long-form text.
* `category`, which represents the type of media the fandom belongs to. Categories include 'Anime & Manga', 'Books & Literature', 'Cartoons & Comics & Graphic Novels', 'Movies', 'Celebrities & Real People', 'Music & Bands', 'Other Media', 'Theater', 'TV Shows', 'Video Games', 'Uncategorized Fandoms', given that `TEXT` can still store long-form text.

#### Comments

The `comments` table includes:
* `id`, which uniquely identifies a comment. It is the primary key and an integer that automatically increments.
* `user_id`, which represents the user who wrote the comment. It is an integer and a foreign key referencing the `users` table.
* `work_id`, which represents the work on which the user commented. It is an integer and a foreign key referencing the `works` table.
* `content`, which represents what the user wrote, given that `TEXT` can still store long-form text.
* `chapter`, which represents the chapter on which the user commented. It is an integer.
* `created_at`, which represents the date and time the comment was created. It is a numeric value with a default value of the current timestamp.

#### Bookmarked

The `bookmarked` table includes:
* `id`, which uniquely identifies a bookmarked work. It is the primary key and an integer that automatically increments.
* `user_id`, which represents the user who bookmarked the work. It is an integer and a foreign key referencing the `users` table.
* `work_id`, which represents the work that was bookmarked. It is an integer and a foreign key referencing the `works` table.
* `collection_id`, which represents the collection to which the bookmarked work belongs. It is an integer and a foreign key referencing the `collections` table.

#### Collections

The `collections` table includes:
* `id`, which uniquely identifies a collection. It is the primary key and an integer that automatically increments.
* `name`, which represents the collection name created by the user as a way of personalizing it, for example, 'chunkybanner56 favorite harry potter fanfics', given that `TEXT` can still store long-form text.
* `contribuitors_ids`, which represents the IDs of the author(s) and contributors of the collection, in other words, who can add and take works from the collection. It is an integer.
* `bookmarks_id`, which represents the works the collection has. It is an integer and a foreign key referencing the `bookmarked` table.
* `creation_date`, which represents the date when the collection was created. It is a datetime value with a default value of the current timestamp.
* `updated_at`, which represents the last time the collection was updated. It is a numeric value with a default value of the current timestamp.

#### Collection Contribuitors Connect

The `collection_contribuitors_connect` table includes:
* `contribuitor_id`, which represents the ID of the contributor. It is an integer and a foreign key referencing the `users` table.
* `collection_id`, which represents the ID of the collection. It is an integer and a foreign key referencing the `collections` table.

#### Collection Works Connect

The `collection_works_connect` table includes:
* `work_id`, which represents the ID of the work. It is an integer and a foreign key referencing the `works` table.
* `collection_id`, which represents the ID of the collection. It is an integer and a foreign key referencing the `collections` table.

#### Work Fandom Connect

The `work_fandom_connect` table includes:
* `work_id`, which represents the ID of the work. It is an integer and a foreign key referencing the `works` table.
* `fandom_id`, which represents the ID of the fandom. It is an integer and a foreign key referencing the `fandoms` table.


* Why did you choose the types you did?

Data types were chosen based on the type of information stored (e.g., text for descriptions, integers for IDs).


* Why did you choose the constraints you did?

Constraints such as primary and foreign keys ensure referential integrity and maintain relationships between entities.


### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

[![](https://mermaid.ink/img/pako:eNp9ksFugzAMQH8l8rn9Ac677rTbxMUlpiBIjIyjaqL8-xIggLpqOcXJ84udZIKKLUEBJB8t3gVd6U0cYSQZ1-mDpRvNOq_RW3Y5qtg58prDG3PnUDqy-37fU6Ut-6g6ec3zeb3ytOcXpgSHHY0lvKEObeIafKFm3lz7Wf_rlnYS8pBWV-bc55vS8MZBs-vU5KuQ6wytqq2y7c4Wk5AZUNQc6J-bymm7duk4cnABR-KwtfG5ppRXgjbkqISE2VhUks6Rw6D89eMrKFQCXUA43BsoauzHGIXBotL23PvqgP6b-YjJtsryuf6O5ZPMvzbIuZ0?type=png)](https://mermaid.live/edit#pako:eNp9ksFugzAMQH8l8rn9Ac677rTbxMUlpiBIjIyjaqL8-xIggLpqOcXJ84udZIKKLUEBJB8t3gVd6U0cYSQZ1-mDpRvNOq_RW3Y5qtg58prDG3PnUDqy-37fU6Ut-6g6ec3zeb3ytOcXpgSHHY0lvKEObeIafKFm3lz7Wf_rlnYS8pBWV-bc55vS8MZBs-vU5KuQ6wytqq2y7c4Wk5AZUNQc6J-bymm7duk4cnABR-KwtfG5ppRXgjbkqISE2VhUks6Rw6D89eMrKFQCXUA43BsoauzHGIXBotL23PvqgP6b-YjJtsryuf6O5ZPMvzbIuZ0)

A User can create multiple Works (One-to-Many).
A Work can have multiple Tags, and a Tag can be associated with multiple Works (Many-to-Many).
A User can Bookmark multiple Works (Many-to-Many).
A User can create multiple Collections, and a Collection can contain multiple Works (Many-to-Many).
A Work can be based of multiple fandoms (however, it usually has only one), and a fandom can have multiple works about it.

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?

Indexes: Created on frequently queried columns such as Username, Title, and TagName to improve search performance.
Views: Defined views for commonly accessed user data (e.g., a view combining Works and Authors to simplify queries for listing works with author names).
Caching: Implemented caching strategies for frequently accessed works to reduce database load.


## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?

Scalability: As the number of works and users grows, performance optimizations such as partitioning or sharding may be needed;
Limited Media Support: The database primarily supports text-based works, so multimedia integration would require significant changes;
User Moderation: No built-in system for content moderation beyond what users and admins manually manage.


* What might your database not be able to represent very well?

Complex Queries: Some Many-to-Many relationships might lead to performance overhead if not optimized properly;
