MAX_DEEP = 3

def create_hash parent_ids, level
  params_hash = []
  rand(1..3).times do |index|
    params_hash << {name: "name#{parent_ids.join('')}#{level}#{index}", title: Faker::Movie.title, content: Faker::Movie.quote}
  end
  params_hash
end

def create_first_nodes
  Post.create(create_hash([], 0))
end

def create_node_children post, level
  new_level = level + 1
  post.children.create(create_hash(post.path_ids, level))
  create_children_for_posts(post.children, new_level) if level < MAX_DEEP
end

def create_children_for_posts(posts, level)
  posts.each do |post|
    create_node_children(post, level)
  end
end

def create_posts
  level = 1
  create_first_nodes
  posts = Post.all
  create_children_for_posts(posts, level)
end

create_posts