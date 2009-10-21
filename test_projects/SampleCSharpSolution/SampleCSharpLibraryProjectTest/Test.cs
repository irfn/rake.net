
using System;
using NUnit.Framework;
using NUnit.Framework.SyntaxHelpers;
using SampleCSharpLibraryProject;

namespace SampleCSharpLibraryProjectTest
{


	[TestFixture]
	public class Test
	{

		[Test]
		public void Failure ()
		{
			var myClass = new MyClass();
			Assert.Fail(string.Format("Failed test {0}", myClass));
		}

		[Test, Ignore]
		public void IgnoredFailure ()
		{
			Assert.Fail("Failed test");
		}
		
		[Test]
		public void Success ()
		{
			Assert.That(1, Is.EqualTo(1));
		}

	}
}
