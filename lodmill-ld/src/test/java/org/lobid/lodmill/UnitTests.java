/* Copyright 2012-2013 Fabian Steeg. Licensed under the Eclipse Public License 1.0 */

package org.lobid.lodmill;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.lobid.lodmill.hadoop.GndNTriplesToJsonLdTests;
import org.lobid.lodmill.hadoop.JsonLdConverterTests;
import org.lobid.lodmill.hadoop.LobidNTriplesToJsonLdTests;
import org.lobid.lodmill.hadoop.ResolveObjectUrisInLobidNTriplesTests;

/**
 * Main test suite for all unit tests.
 * 
 * @author Fabian Steeg (fsteeg)
 */
@RunWith(Suite.class)
@Suite.SuiteClasses({ LobidNTriplesToJsonLdTests.class,
		GndNTriplesToJsonLdTests.class,
		ResolveObjectUrisInLobidNTriplesTests.class, JsonLdConverterTests.class })
public final class UnitTests {
	/* Suite class, groups tests via annotation above */
}