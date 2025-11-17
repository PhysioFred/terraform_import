# Create the root level hierarchy structure
resource "aws_connect_user_hierarchy_structure" "main" {
  instance_id = aws_connect_instance.existing.id

  hierarchy_structure {
    level_one {
      name = "Organisation"
    }
    level_two {
      name = "State"
    }
    level_three {
      name = "Location"
    }
    level_four {
      name = "Department"
    }
  }
}

resource "aws_connect_user_hierarchy_group" "diamond" {
  instance_id = aws_connect_instance.existing.id
  name        = "Diamond"

  tags = {
    "Name" = "Organization Diamond"
  }
}

resource "aws_connect_user_hierarchy_group" "nsw" {
  instance_id     = aws_connect_instance.existing.id
  name            = "NSW"
  parent_group_id = aws_connect_user_hierarchy_group.diamond.hierarchy_group_id
}

resource "aws_connect_user_hierarchy_group" "liverpool" {
  instance_id     = aws_connect_instance.existing.id
  name            = "Liverpool"
  parent_group_id = aws_connect_user_hierarchy_group.nsw.hierarchy_group_id
}

resource "aws_connect_user_hierarchy_group" "bankstown" {
  instance_id     = aws_connect_instance.existing.id
  name            = "Bankstown"
  parent_group_id = aws_connect_user_hierarchy_group.nsw.hierarchy_group_id
}

resource "aws_connect_user_hierarchy_group" "it" {
  instance_id     = aws_connect_instance.existing.id
  name            = "IT"
  parent_group_id = aws_connect_user_hierarchy_group.liverpool.hierarchy_group_id
}

resource "aws_connect_user_hierarchy_group" "hr" {
  instance_id     = aws_connect_instance.existing.id
  name            = "HR"
  parent_group_id = aws_connect_user_hierarchy_group.bankstown.hierarchy_group_id
}