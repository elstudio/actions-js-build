FROM node:10-alpine

LABEL version="1.0.0"
LABEL repository="https://github.com/elstudio/actions-js-build"
LABEL homepage="https://github.com/elstudio/actions-js-build"
LABEL maintainer="el-studio Actions <servers+actions@el-studio.com>"

LABEL com.github.actions.name="GitHub Action to execute javascript build tools"
LABEL com.github.actions.description="Executes npm install, followed by gulp or grunt (whichever has a build file)."
LABEL com.github.actions.icon="truck"
LABEL com.github.actions.color="purple"
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["default"]
