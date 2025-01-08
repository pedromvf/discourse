import DiscourseRoute from "discourse/routes/discourse";
import { i18n } from "discourse-i18n";

export default class AdminConfigSearchRoute extends DiscourseRoute {
  titleToken() {
    return i18n("admin.advanced.sidebar_link.search");
  }
}