package com.cqan.shiro.realm;

import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.cqan.system.Permission;
import com.cqan.system.Role;
import com.cqan.system.User;
import com.google.common.collect.Sets;
import com.cqan.service.UserService;


/**
 * <p>User: huiwu
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public class ShiroRealm extends AuthorizingRealm {

	@Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String)principals.getPrimaryPrincipal();

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        User user = userService.findByUserName(username);
        if (user!=null) {
        	Set<String> roles = Sets.newHashSet();
        	Set<String> permissions = Sets.newHashSet();
        	List<Role> list = user.getRoles();
        	if (list!=null&&list.size()>0) {
				for (Role r : list) {
					roles.add(r.getRoleCode());
					List<Permission> ps = r.getPermissions();
					if (ps!=null&&ps.size()>0) {
						for (Permission p : ps) {
							permissions.add(p.getPermissionCode());
						}
					}
				}
			}
			authorizationInfo.setRoles(roles);
			authorizationInfo.setStringPermissions(permissions);
		}
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String username = (String)token.getPrincipal();

        User user = userService.findByUserName(username);

        if(user == null) {
            throw new UnknownAccountException();//没找到帐号
        }

        if(user.getStatus()!=1) {
            throw new LockedAccountException(); //帐号锁定
        }

        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
        		user.getUserName(), //用户名
        		user.getPassword(), //密码
                ByteSource.Util.bytes(user.getUserName()),//salt=username
                getName()  //realm name
        );
        return authenticationInfo;
    }

    @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }

}
