import glob from 'glob';
import fs from 'fs';

const fileContainsLifeCycle = async (file, options) => {
  const fileContents = await fs.promises.readFile(file, {encoding: 'utf-8'})
  return {
    matchesInterfaceRegex: options.interfaceRegex.test(fileContents),
    matchesMethodRegex: options.methodRegex.test(fileContents),
    includesInterfaceName: fileContents.includes(options.interfaceName),
    includesMethodName: fileContents.includes(options.methodName),
    file,
    contents: fileContents
  };
};

const clearOrphanedLifeCycle = async (methodName, interfaceName) => {
	const interfaceRegex = new RegExp(interfaceName, 'g');
	const methodRegex = new RegExp(methodName, 'g');

	const fixFile = (fileContents) => {
	  const leadingCommaInterface = new RegExp(`, ?${interfaceName} ?`, 'g');
	  const trailingCommaInterface = new RegExp(` +${interfaceName}, ?\n?`, 'g');
          const implementsOnlyInterface = new RegExp(`implements ${interfaceName} \{`);

	  return fileContents
	    .replace(leadingCommaInterface, ' ')
	    .replace(trailingCommaInterface, ' ')
	    .replace(implementsOnlyInterface, '{');
	};

	const matched = (await Promise.all(await glob('**/*.ts', { ignore: 'node_modules/**' })
	  .then(async (files) => 
	    {
	      console.log(`file count: ${files.length}`);
	      return files.map(file => fileContainsLifeCycle(
		      file,
		      {
			      interfaceRegex,
			      methodRegex,
			      interfaceName,
			      methodName
		      })
	      );
	    })))
	  .filter(match => {
	    return match.matchesInterfaceRegex && !match.matchesMethodRegex;
	  });

	console.log(`matched files: ${matched.length}`);
	console.log(`fixing ${matched.length} files`);

	await Promise.all(matched.map((match) => {
	  console.log(match.file)
	  return fs.promises.writeFile(match.file, fixFile(match.contents));
	}))
}


await clearOrphanedLifeCycle('ngOnInit', 'OnInit');
