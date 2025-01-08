import Component from "@glimmer/component";
import { concat } from "@ember/helper";
import { action } from "@ember/object";
import EmojiPickerContent from "discourse/components/emoji-picker/content";
import concatClass from "discourse/helpers/concat-class";
import replaceEmoji from "discourse/helpers/replace-emoji";
import icon from "discourse-common/helpers/d-icon";
import DMenu from "float-kit/components/d-menu";

export default class EmojiPicker extends Component {
  @action
  onRegisterMenu(api) {
    this.menu = api;
  }

  get icon() {
    return this.args.icon ?? "discourse-emojis";
  }

  get context() {
    return this.args.context ?? "topic";
  }

  <template>
    <DMenu
      @triggerClass={{concatClass @btnClass}}
      @contentClass="emoji-picker-content"
      @onRegisterApi={{this.onRegisterMenu}}
      @identifier="emoji-picker"
      @groupIdentifier="emoji-picker"
      @modalForMobile={{true}}
      @maxWidth={{405}}
      @onShow={{@onShow}}
      @onClose={{@onClose}}
    >
      <:trigger>
        {{#if @icon}}
          {{replaceEmoji (concat ":" @icon ":")}}
        {{else}}
          {{icon "discourse-emojis"}}
        {{/if}}

        {{#if @label}}
          <span class="d-button-label">{{@label}}</span>
        {{else}}
          &#8203;
        {{/if}}
      </:trigger>

      <:content>
        <EmojiPickerContent
          @close={{this.menu.close}}
          @didSelectEmoji={{@didSelectEmoji}}
          @context={{this.context}}
        />
      </:content>
    </DMenu>
  </template>
}