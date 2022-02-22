package com.EIE.demo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.EIE.demo.dao.CompteRepository;
import com.EIE.demo.dao.PrRoleRepository;
import com.EIE.demo.dao.UserRepository;
import com.EIE.demo.dao.UserRoleExistRepository;
import com.EIE.demo.model.Compte;
import com.EIE.demo.model.ProfilRole;
import com.EIE.demo.model.User;
import com.EIE.demo.model.UserRoleExist;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private CompteRepository usersRepository;

	@Autowired
	private PrRoleRepository roless;

	@Override

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Compte user = usersRepository.siExiste(username);

		if (user == null)
			throw new UsernameNotFoundException(username);
		List<ProfilRole> roles =new ArrayList<ProfilRole>();
		if (user.getProfil() != null) {
			roles = roless.getAllProfilRoles(user.getProfil().getProfilId());
		}

		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();

		for (ProfilRole role : roles) {
			String i = role.getRole().getNomFr();
			grantedAuthorities.add(new SimpleGrantedAuthority(i));
		}

		return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(),
				grantedAuthorities);
	}
}
