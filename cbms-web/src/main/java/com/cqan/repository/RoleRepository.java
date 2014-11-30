package com.cqan.repository;

import com.cqan.system.Role;

public interface RoleRepository extends BaseRepository<Role, Long> {

	Role findByRoleCode(String roleCode);

}
