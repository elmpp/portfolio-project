/**
 * Simple typings until community types added
 *
 *  - Types inspired by GH issue - https://tinyurl.com/y3qhe2pe
 */
// import * as inquirer from '../../../node_modules/inquirer'
// declare type inquirer = import('inquirer')


// taken from node-plop - https://tinyurl.com/yxhgnf7n
interface NodePlopAPI {
  getGenerator(name: string): PlopGenerator;
  setGenerator(name: string, config: PlopGenerator): PlopGenerator;

  setPrompt(name: string, prompt: inquirer.PromptModule): void;
  setWelcomeMessage(message: string): void;
  getWelcomeMessage(): string;
  getGeneratorList(): { name: string; description: string }[];
  setPartial(name: string, str: string): void;
  getPartial(name: string): string;
  getPartialList(): string[];
  setHelper(name: string, fn: HelperFunction): void;
  getHelper(name: string): Function;
  getHelperList(): string[];
  setActionType(name: string, fn: CustomActionFunction): void;
  getActionType(name: string): ActionType;
  getActionTypeList(): string[];

  setPlopfilePath(filePath: string): void;
  getPlopfilePath(): string;
  getDestBasePath(): string;

  // plop.load functionality
  load(
    target: string[] | string,
    loadCfg: PlopCfg,
    includeOverride: boolean
  ): void;
  setDefaultInclude(inc: object): void;
  getDefaultInclude(): object;

  renderString(template: string, data: any): String; //set to any matching handlebars declaration

  // passthroughs for backward compatibility
  addPrompt(name: string, prompt: inquirer.PromptModule): void;
  addPartial(name: string, str: string): void;
  addHelper(name: string, fn: Function): void;
}

// extend the standard question type to allow extensions e.g. - https://tinyurl.com/y28xvl52
type Prompt = import('inquirer').Question & {
  [key: string]: any
}

interface PlopGenerator {
  description: string
  prompts: Prompt[] // import() types - https://tinyurl.com/y2zol2mc
  // actions: (ActionConfig | CustomActionFunction)[]
  actions: ActionType
}

type CustomActionsConfig = (
  answers: Dictionary<any>,
  config?: ActionConfig,
  plopfileApi?: NodePlopAPI
) => Promise<Omit<ActionType, 'CustomActionFunction'>[]> | Omit<ActionType, 'CustomActionFunction'>[]; // Check return type?


type ActionType =
  | ActionConfig
  | AddManyActionConfig
  | ModifyActionConfig
  | AppendActionConfig
  | CustomActionsConfig;

interface ActionConfig {
  type: string;
  force: boolean;
  data: object;
  abortOnFail: boolean;
}

interface AddActionConfig extends ActionConfig {
  type: "add";
  path: string;
  template: string;
  templateFile: string;
  skipIfExists: boolean;
}

interface AddManyActionConfig
  extends Pick<AddActionConfig, Exclude<keyof AddActionConfig, "type">> {
    type: "addMany";
  destination: string;
  base: string;
  templateFiles: string;
  globOptions: GlobbyOptions;
  verbose: boolean;
}

interface ModifyActionConfig extends ActionConfig {
  type: "modify";
  path: string;
  pattern: string | RegExp;
  template: string;
  templateFile: string;
}

interface AppendActionConfig extends ActionConfig {
  type: "append";
  path: string;
  pattern: string | RegExp;
  unique: boolean;
  separator: string;
  template: string;
  templateFile: string;
}

// from here - https://tinyurl.com/y3kq34gt
type CustomActionFunction = (
  answers: import('inquirer').Answers,
  config?: ActionConfig,
  plopfileApi?: NodePlopAPI
) => Promise<string> | string; // Check return type?

// docs - https://tinyurl.com/yyzfgwjx
interface ActionConfig{
  type: string;
  path: string;
  templateFile: string;
  force?: boolean;
  data?: object;
  abortOnFail?: boolean;
}

interface PlopCfg{
  force: boolean;
  destBasePath: string;
}
